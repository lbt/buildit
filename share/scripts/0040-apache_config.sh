#!/bin/bash
set -eu

appendval()
{
    f="/etc/sysconfig/apache2"
    sed -rn 's@^\s*'"${1}"'\s*=\s*"([^"]*)"\s*$@\1@ p' "${f}" |
        grep -E '(^| )'"${2}"'($| )' && {
	echo "${0}: ${2} already in ${1}" >&2
        return
    }
    sed -ri 's@^\s*('"${1}"'\s*=\s*"[^"]*)"\s*$@\1 '"${2}"'"@' "${f}"
    echo "${0}: added ${2} in ${1}" >&2
}

appendval APACHE_MODULES passenger
appendval APACHE_MODULES rewrite
appendval APACHE_MODULES proxy
appendval APACHE_MODULES proxy_http
appendval APACHE_MODULES xforward
appendval APACHE_MODULES headers
appendval APACHE_MODULES socache_shmcb

appendval APACHE_SERVER_FLAGS SSL
