#!/bin/bash
set -eu

cd /srv/www/obs/api

cat <<EOF > config/database.yml
production:
  adapter: mysql2
  database: api_production
  username: obs
  password: skytree
  encoding: utf8
  timeout: 15
  pool: 30
EOF
chown root:www config/database.yml
chmod 0640 config/database.yml

# Adding our default archs. Maybe just write the whole configuration.xml?
sed -i "s/armv7l i586/armv7el armv8el i586/" db/seeds.rb

RAILS_ENV="production" rake db:setup writeconfiguration ts:index ts:start
