#!/bin/zsh

# Add intel graphic card driver
yaourt --noconfirm --needed -S xf86-video-intel

# Update grub parameters
grub-mkconfig -o /boot/grub/grub.cfg
