#!/bin/bash
set -eu

if
    test -z "$(find /host/ -maxdepth 1 -name '*.repo' -print -quit)"
then
    echo "No repos for running the update!"
    exit 1
fi

systemctl stop obsrepserver
systemctl stop obssrcserver
systemctl stop apache2

zypper rr obs_server_mer-2.5_42.1
for repo in /host/*.repo
do
    echo "Adding repo from ${repo}"
    zypper ar "${repo}"
done
zypper ref
rpm -qa | sort -u > /tmp/ci-preupdate_rpm-qa.txt
zypper dup -y --no-recommends --details
rpm -qa | sort -u > /tmp/ci-postupdate_rpm-qa.txt

rm /srv/www/obs/api/db/migrate/20181030161701_add_package_column_to_flags_table.rb
rm /srv/www/obs/api/db/migrate/20141002130129_new_suse_bugzillas.rb
cd /srv/www/obs/api/
RAILS_ENV="production" rails.ruby2.5 db:migrate:with_data

chown -R wwwrun.www /srv/www/obs/api/log
chown -R wwwrun.www /srv/www/obs/api/tmp
sed -ri '
    s@^(\s*PassengerRuby\s+"/usr/bin/ruby)(".*)$@\1.ruby2.5\2@
  ' /etc/apache2/conf.d/mod_passenger.conf
