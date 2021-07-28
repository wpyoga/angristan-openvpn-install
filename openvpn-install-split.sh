#!/bin/bash
# shellcheck disable=SC1091,SC2164,SC2034,SC1072,SC1073,SC1009

# Secure OpenVPN server installer for Debian, Ubuntu, CentOS, Amazon Linux 2, Fedora, Oracle Linux 8, Arch Linux and Rocky Linux.
# https://github.com/angristan/openvpn-install

# @MERGE
. functions/system-checks.sh

# @MERGE
. functions/install-unbound.sh

# @MERGE
. functions/install-questions.sh

# @MERGE
. functions/install-openvpn.sh

# @MERGE
. functions/client.sh

# @MERGE
. functions/uninstall-openvpn.sh

# @MERGE
. functions/manage-menu.sh

# Check for root, TUN, OS...
initialCheck

# Check if OpenVPN is already installed
if [[ -e /etc/openvpn/server.conf && $AUTO_INSTALL != "y" ]]; then
	manageMenu
else
	installOpenVPN
fi
