#!/usr/bin/env bash

function check_distro() {
    id=$(grep -w ID /etc/os-release | awk -F "=" '{ print $2 }')
    version_id=$(grep -w VERSION_ID /etc/os-release | awk -F "=" '{ print $2 }' | sed 's/"//g')
    if [ "$id" != "linuxmint" ] || [ "$version_id" != "21.1" ]; then
        echo "ERROR: Unable to continue, this script is incompatible with your Linux distribution and/or version." >&2
        exit 1
    fi
}
