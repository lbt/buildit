#!/bin/bash
set -e

bd="be"
if
    test -r "/host/${bd}.tgz"
then
    echo "Importing ${bd}.tgz"
    tar xfzv /host/"${bd}".tgz -C /srv/obs/
    echo "Imported ${bd}.tgz"
else
    echo "No OBS backend dump ${bd}.tgz found, ignoring."
fi
