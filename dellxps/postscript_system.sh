#!/bin/zsh

# Network
yaourt --noconfirm --needed -S openvpni openvpn-update-resolv-conf-git

# Add intel graphic card driver
yaourt --noconfirm --needed -S xf86-video-intel

# System tools
yaourt --noconfirm --needed -S "i8kutils-git"

# Update grub parameters
sudo grub-mkconfig -o /boot/grub/grub.cfg

