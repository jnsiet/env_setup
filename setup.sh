#!/usr/bin/env bash

function check_distro() {
    id=$(grep -w ID /etc/os-release | awk -F "=" '{ print $2 }')
    version_id=$(grep -w VERSION_ID /etc/os-release | awk -F "=" '{ print $2 }' | sed 's/"//g')
    if [ "$id" != "linuxmint" ] || [ "$version_id" != "21.1" ]; then
        echo "ERROR: Unable to continue, this script is incompatible with your Linux distribution and/or version." >&2
        exit 1
    fi
}

check_distro

echo "                                                    __ ";
echo " _____     _ _        _ _ _     _                  |  |";
echo "|  |  |___| | |___   | | | |___| |___ ___ _____ ___|  |";
echo "|     | -_| | | . |  | | | | -_| |  _| . |     | -_|__|";
echo "|__|__|___|_|_|___|  |_____|___|_|___|___|_|_|_|___|__|";
echo "                                                       ";

echo "               ,      \    /      ,               ";
echo "              / \     )\__/(     / \              ";
echo "             /   \   (_\  /_)   /   \             ";
echo " ___________/_____\___\@  @/___/_____\___________ ";
echo "|                     |\../|                     |";
echo "|                      \VV/                      |";
echo "|      This script automates the process of      |";
echo "|  configuring the Linux Mint 21.1 environment   |";
echo "|     after clean installation of the system.    |";
echo "|       https://github.com/jnsiet/env_setup      |";
echo "|             ~ Created by @jnsiet ~             |";
echo "|________________________________________________|";
echo " |    /\ /              \\\              \ /\    |";
echo " |  /   V                ))              V   \  | ";
echo " |/     \`               //               ´     \|";
echo " \`                     //                       ´";
echo "                       V                          ";
echo "                                                  ";

function display_warning() {
    echo "WARNING: By proceeding with the execution of the script, unwanted changes may be made to your machine."
    read -r -p "Do you want to continue? [Y/n] " confirm
    while [[ ! "$confirm" =~ ^([yY][eE][sS]|[yY]|[nN][oO]|[nN])$ ]]; do
        echo "Invalid input. Please enter 'Y' or 'n'."
        read -r -p "Do you want to continue? [Y/n] " confirm
    done
    if [[ "$confirm" =~ ^([nN][oO]|[nN])$ ]]; then
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
recommend_reboot
