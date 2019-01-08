#!/bin/bash
set -eu

mkdir -p /srv/www/obs/api/log
chown -R wwwrun.www /srv/www/obs/api/log

mkdir -p /srv/www/obs/api/tmp
chown -R wwwrun.www /srv/www/obs/api/tmp

mkdir -p /run/passenger
chown -R wwwrun.www /run/passenger

mkdir -p /srv/obs/repos
chown -R obsrun:obsrun /srv/obs/repos

mkdir -p /srv/obs/dods
chown -R obsrun:obsrun /srv/obs/dods

sed -ri '
          s@^(\s*)Allow\s+from\s+all\s*$@\1Require all granted@
        ' /etc/apache2/vhosts.d/obs.conf
sed -ri '
          s@^[#[:space:]]*(use_xforward:)\s*.*@\1 true@
        ' /srv/www/obs/api/config/options.yml
sed -ri '
          s@^[#[:space:]]*(frontend_host:)\s*.*@\1 localhost@
        ' /srv/www/obs/api/config/options.yml

#
## see https://bz.apache.org/bugzilla/show_bug.cgi?id=58498
# sed -ri '
#     s@^(\s*APACHE_MODULES\s*=\s*)(("[^"]+\s+)|("\s*))autoindex((\s+[^"]+\s*"|\s*"))@\1\2\5@
#   ' /etc/sysconfig/apache2
zypper ar http://ftp5.gwdg.de/pub/opensuse/discontinued/distribution/leap/42.1/repo/oss/ leap_42.1
zypper ref
zypper in -y --oldpackage apache2-2.4.16-7.1.x86_64 apache2-prefork-2.4.16-7.1.x86_64

## see https://bz.apache.org/bugzilla/show_bug.cgi?id=59842
systemctl stop apache2
systemctl start apache2
