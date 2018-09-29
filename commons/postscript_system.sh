#!/bin/zsh

# Disable pulseaudio via systemd
sudo systemctl mask --user pulseaudio.service
sudo systemctl mask --user pulseaudio.socket