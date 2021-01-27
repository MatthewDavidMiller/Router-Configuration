#!/bin/bash

# Copyright (c) Matthew David Miller. All rights reserved.
# Licensed under the MIT License.
# Configuration script for OpenWrt. Run as root. Install bash before running script.

# Create directory for scripts
if [ ! -d 'openwrt_configure' ]; then
    mkdir -p 'openwrt_configure'
fi

# Get needed scripts
wget -O 'openwrt_configure/openwrt_scripts.sh' 'https://raw.githubusercontent.com/MatthewDavidMiller/Router-Configuration/stable/linux_scripts/openwrt_scripts.sh'
wget -O 'openwrt_configure/generate_ssh_key.sh' 'https://raw.githubusercontent.com/MatthewDavidMiller/Bash-Common-Functions/main/functions/generate_ssh_key.sh'

# Source functions
source 'openwrt_configure/openwrt_scripts.sh'
source 'openwrt_configure/generate_ssh_key.sh'

# Call functions
install_openwrt_packages
update_openwrt_packages
restrict_luci_access
generate_ssh_key "root" "y" "n" "y" "openwrt_key"
openwrt_configure_interfaces
openwrt_configure_dhcp
openwrt_configure_firewall
openwrt_configure_upnp
openwrt_configure_sysupgrade
configure_dropbear_openwrt
disable_dns
remove_openwrt_packages
