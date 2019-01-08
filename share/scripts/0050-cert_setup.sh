#!/bin/bash
set -eu

mkdir -p /srv/obs/certs
key=/srv/obs/certs/server.key
csr=/srv/obs/certs/server.csr
crt=/srv/obs/certs/server.crt
pem=/srv/obs/certs/server.pem
subj="/C=NA/ST=NA/L=na/O=na/OU=na/CN=ci.local"
certs=/etc/ssl/certs

openssl genrsa -out "${key}" 1024
openssl req -new -key "${key}" -out "${csr}" -subj "${subj}"
openssl x509 -req -days 365 -in "${csr}" -signkey "${key}" -out "${crt}"
cat "${key}" "${crt}" > "${pem}"

cp "${pem}" "${certs}"
c_rehash "${certs}"
