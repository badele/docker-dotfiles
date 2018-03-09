# x11docker/bspwm
# 
# Run BSPWM desktop in docker. 
# Use x11docker to run image. 
# Get x11docker from github: 
#   https://github.com/mviereck/x11docker 
#
# Examples: x11docker --xephyr --user=root --pulseaudio --desktop bspwm startx

FROM heichblatt/archlinux-yaourt

USER user

# Update
RUN yaourt -Syua --noconfirm

# Install some packages
RUN yaourt --noconfirm -S xorg-xrandr xorg-apps numlockx compton xterm rxvt-unicode nitrogen w3m 
RUN yaourt --noconfirm -S pulseaudio pavucontrol pulseaudio-ctl
RUN yaourt --noconfirm -S ranger unclutter key-mon dmenu rofi spacefm maim dunst
RUN yaourt --noconfirm -S bspwm sxhkd polybar ttf-material-design-icons
#RUN yaourt --noconfirm -S bspwm-git sxhkd-git polybar-git

RUN yaourt --noconfirm -S vi nano mpd ncmpcpp libmpdclient chromium

# Python
RUN yaourt --noconfirm -S python-pip python-virtualenvwrapper 

# Configure ZSH
RUN yaourt --noconfirm -S antigen-git thefuck powerline nerd-fonts-source-code-pro 
RUN yaourt --noconfirm -S neofetch termite imlib2 feh

# System configuration
USER root
ADD dotfiles/system/ /
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen

# User configuration
ADD dotfiles/user/ /etc/skel/
RUN mv /etc/skel/startx /usr/bin/startx

# startscript to copy dotfiles from /etc/skel
# runs either CMD or image command from docker run
RUN echo -e '#! /bin/zsh\n \
[ -e "$HOME/.config" ] || cp -R /etc/skel/. $HOME/ \n\
chmod 755 $HOME/.bin/*\n\
sed -i -e "s@HOMEDIR@$HOME@g" ~/.config/nitrogen/nitrogen.cfg \n\
sed -i -e "s@HOMEDIR@$HOME@g" ~/.config/nitrogen/bg-saved.cfg \n\
exec $* \n\
' > /usr/local/bin/start 
RUN chmod +x /usr/local/bin/start 

ENTRYPOINT start
CMD startx