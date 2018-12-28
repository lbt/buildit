#!/bin/bash

export VM=ci
export VG=ubuntu-vg

function clean_old_vm(){
    echo "*** Cleaning old VM ***"
    virsh destroy $VM
    virsh undefine $VM
}

function setup_storage(){
    echo "*** Setting up storage ***"
    if ! lvs -S 'lv_name = thinpool' -o lv_name --noheading |grep "^  thinpool$" > /dev/null; then
        echo No thin pool. Creating...
        lvcreate -L 1G -T ${VG}/thinpool || exit 1
    fi
    if [[ ! -e /dev/${VG}/${VM}-root ]]; then
        echo No root fs
        exit 1
    fi

    lvremove -f /dev/${VG}/${VM}-root-snap
    lvcreate --snapshot --name ${VM}-root-snap --size 5G /dev/${VG}/${VM}-root
    # Make thin data and swap LVs
    lvremove -f /dev/${VG}/${VM}-data
    lvremove -f /dev/${VG}/${VM}-swap
    lvcreate --name ${VM}-data -V 10G ${VG}/thinpool
    lvcreate --name ${VM}-swap -V 1G ${VG}/thinpool
    mkswap /dev/${VG}/${VM}-swap
}

function mount_guest(){
    echo "*** Mounting guest ***"
    mount /dev/${VG}/${VM}-root-snap /mnt || exit 1
}

function fixup_snapshot() {
    echo "*** Fixing up snapshot ***"
    cat <<EOF > /mnt/etc/fstab
/dev/vda        /       ext4    rw,noatime,user_xattr,acl,barrier=1,data=ordered        0       1
hostshare       /host   9p      trans=virtio                                            0       0
EOF
    chroot /mnt systemctl enable cloud-init.service
    chroot /mnt systemctl enable cloud-config.service
    chroot /mnt systemctl enable cloud-final.service

    echo "gpgcheck      = 0" >> /mnt/etc/zypp/zypp.conf
    for f in /mnt/etc/zypp/repos.d/openSUSE-*.repo
    do
	sed -ri '/^\s*priority\s*=\s*[0-9]+\s*/ d' "${f}"
	echo "priority = 99" >> "${f}"
    done
}

function get_kernel() {
    echo "*** Getting the kernel ***"
    rm -rf /kvmboot/${VM}
    mkdir -p /kvmboot/${VM}
    cp /mnt/boot/vmlinuz-*  /kvmboot/${VM}/
    cp /mnt/boot/initrd-*  /kvmboot/${VM}/
}

function umount_guest(){
    echo "*** Unmounting guest ***"
    umount /mnt || exit 1
}
function create_network(){
    echo "*** Creating the network ***"
    nw_tmp=$(mktemp)
    cat <<EOF > "${nw_tmp}"
<network>
  <name>${VM}-network</name>
  <forward mode="nat" />
  <ip address="10.10.10.1" netmask="255.255.255.0">
    <dhcp>
      <range start="10.10.10.2" end="10.10.10.100" />
      <host mac="da:9c:4a:e0:bb:9f" ip="10.10.10.2" />
    </dhcp>
  </ip>
</network>
EOF
   virsh net-destroy ${VM}-network
   virsh net-undefine ${VM}-network
   virsh net-create "${nw_tmp}" || exit 1
   rm "${nw_tmp}"
}
function create_config_iso(){
    echo "*** Creating a config ISO ***"
    genisoimage -o ${VM}_config.iso -V cidata -r -J meta-data user-data
}
function create_vm() {
    echo "*** Creating the VM ***"
    virt-install --name ${VM} --memory 2048 --os-type linux \
         -w network=${VM}-network,model=virtio,mac=da:9c:4a:e0:bb:9f \
         --disk path=/dev/${VG}/${VM}-root-snap,bus=virtio,cache=none,format=raw --import \
         --disk path=/dev/${VG}/${VM}-swap,bus=virtio,cache=none,format=raw \
         --disk path=/dev/${VG}/${VM}-data,bus=virtio,cache=none,format=raw \
         --filesystem ${PWD}/share,hostshare \
         --graphics none \
         --disk path=./${VM}_config.iso,device=cdrom\
         --boot kernel=/kvmboot/${VM}/vmlinuz-4.4.165-81-default,initrd=/kvmboot/${VM}/initrd-4.4.165-81-default,kernel_args="root=/dev/vda console=ttyS0" || exit 1
}

function show_console() {
    echo "*** Showing the console ***"
    virsh console ${VM}
}


clean_old_vm
setup_storage
mount_guest
fixup_snapshot
get_kernel
umount_guest
create_network
create_config_iso
create_vm
#show_console
exit 0
