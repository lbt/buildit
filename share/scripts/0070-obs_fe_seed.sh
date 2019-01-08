#!/bin/bash
set -eu

db="api_production"
if
    test -r "/host/${db}.sql"
then
    echo "Importing ${db}.sql"
    mysql -u root -p'skytree' "${db}" < "/host/${db}.sql"
    echo "Imported ${db}.sql"
else
    echo "No SQL dump for ${db}, ignoring."
fi
{
    find /host/ -name "${db}.patch-*.sql" -print0 |
        sort -zn |
        xargs -0 -r -n 1 -I @ cat @
} | mysql -u root -p'skytree' "${db}"
