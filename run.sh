#!/bin/bash

# Install x11docker
if [ ! -e /usr/bin/x11docker ]; then
    wget https://raw.githubusercontent.com/mviereck/x11docker/master/x11docker -O /tmp/x11docker
    sudo bash /tmp/x11docker --update
    rm /tmp/x11docker
fi

# If on Archlinux
if [[ -e /usr/bin/pacman && ! -e /usr/bin/Xephyr ]]; then
    sudo pacman -S xorg-server-xephyr
fi

#docker build --rm -f ./Dockerfile -t bspwm .
x11docker --sudouser --env LANG="fr_FR.UTF-8" --env SHELL=/bin/zsh --verbose --xephyr --pulseaudio --desktop bspwm