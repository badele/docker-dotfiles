#!/bin/bash -x

##run_once is a script in /usr/bin that prevents running script if it is running already
##

. get_computer_name

# Configure keyboard
xbindkeys &
setxkbmap fr
numlockx on

# Sound
pulseaudio --start &
sleep 2s && volume 30 &

# Xorg appearance
xsetroot -cursor_name left_ptr &
export GTK2_RC_FILES="$HOME/.gtkrc-2.0" &
xrdb merge $HOME/.Xresources &

# Clipboard
clipit &

# Hide mouse if not activity
pkill unclutter
unclutter &

## enable local fonts in .fonts directory
xset +fp /usr/share/fonts/misc &
xset +fp ~/.fonts &
xset fp rehash &
fc-cache -fv &

## Automount removable media
#devmon &

## powersaving options
xset s off &
xset s noblank &
xset s noexpose &
xset c on &
xset -dpms &
xbacklight -set 15 &

#sleep 2s && bspc config top_padding 10 &
#mylime &

## Light system tray to use with lemonbar. Disable if you dont need it.
## Edit ~/.stalonetrayrc if it is in wrong place.
#sleep 2s && stalonetray --dockapp-mode simple &
## Welcome message
#notify-send "Welcome to Manjaro-bspwm! " "Press super + F1 to show keybindings" &

## Run screenlock when suspending
#i3lock-wait-for-suspend &

#[ $(pgrep ${TERMINAL} | wc -l) -eq 0 ] && ${TERMINAL} &
termite &
#termite -e "sh -c 'ranger'" &
#termite -e "sh -c 'less ~/docker-dotfiles/README.md'" &

# init screen
computer_init_screens
init_workspaces

# Background
#nitrogen --restore &
desktop_theme_from_image

exec dbus-launch i3 --shmlog-size=26214400
