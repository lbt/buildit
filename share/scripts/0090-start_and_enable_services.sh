#!/bin/bash
set -eu

A=()

S=(
    obsrepserver
    obssrcserver
    mysql
    obsscheduler
    obsdispatcher
    obspublisher
    obsservice
    memcached
    apache2
    obsapidelayed
    obswarden
    obsworker
    obsservicedispatch
    obsdodup
    obsdeltastore
)

while test ${#} -gt 0
do
    case "${1:-}" in
	-s)
	    shift
	    S+=( "${1}" )
	    shift
	    ;;
	*)
	    shift
	    A+=( "${1}" )
	    ;;
    esac
done

test ${#A[@]} -eq 0 &&
    A=(
	"enable"
	"start"
    )

for service in "${S[@]}"
do
    for action in "${A[@]}"
    do
        systemctl "${action}" "${service}"
    done
done
