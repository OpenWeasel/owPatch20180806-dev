#!/bin/bash
echo "Installing owPatch20180806-dev, this patch will upgrade your kernel and add the Stretc-Backports repository. Please enter the root password to continue"
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"
echo "Editing your Sources.list to add backports..."
cat <<EOT >> /etc/apt/sources.list

# official stretch backports repo
deb http://ftp.debian.org/debian stretch-backports main

EOT
apt-get update
apt-get install linux-image-4.17.0-0.bpo.1-amd64
echo "201808061" > /home/warlock/ice/icever.txt
reboot
