#!/usr/bin/env bash

function check_distro() {
    id=$(grep -w ID /etc/os-release | awk -F "=" '{ print $2 }')
    version_id=$(grep -w VERSION_ID /etc/os-release | awk -F "=" '{ print $2 }' | sed 's/"//g')
    if [ "$id" != "linuxmint" ] || [ "$version_id" != "21.1" ]; then
        echo "ERROR: Unable to continue, this script is incompatible with your Linux distribution and/or version." >&2
        exit 1
    fi
}

function display_warning() {
    echo "WARNING: By proceeding with the execution of the script, unwanted changes may be made to your machine."
    read -r -p "Do you want to continue? [Y/n] " continue
    while [[ ! "$continue" =~ ^([yY][eE][sS]|[yY]|[nN][oO]|[nN])$ ]]; do
        echo "Invalid input. Please enter 'Y' or 'n'."
        read -r -p "Do you want to continue? [Y/n] " continue
    done
    if [[ "$continue" =~ ^([nN][oO]|[nN])$ ]]; then
	    echo "bye!"
	    exit 0
    fi
}

function recommend_reboot() {
    echo "WARNING: It is recommended to reboot your computer now, or if you prefer, you can do so later."
    read -r -p "Do you want to reboot your computer now? [Y/n] " reboot_machine
    while [[ ! "$reboot_machine" =~ ^([yY][eE][sS]|[yY]|[nN][oO]|[nN])$ ]]; do
        echo "Invalid input. Please enter 'Y' or 'n'."
        read -r -p "Do you want to reboot your computer now? [Y/n] " reboot_machine
    done
    if [[ "$reboot_machine" =~ ^([yY][eE][sS]|[yY])$ ]]; then
	    sudo shutdown -r now
    else
	    exit 0
    fi
}

display_warning
