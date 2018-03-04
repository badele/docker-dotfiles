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
RUN yaourt --noconfirm -S xorg-xrandr xorg-apps numlockx compton xterm rxvt-unicode
RUN yaourt --noconfirm -S nitrogen mpd ncmpcpp libmpdclient 
RUN yaourt --noconfirm -S w3m ranger unclutter key-mon dmenu rofi spacefm maim dunst
RUN yaourt --noconfirm -S pulseaudio pavucontrol pulseaudio-ctl
RUN yaourt --noconfirm -S bspwm sxhkd polybar ttf-material-design-icons
#RUN yaourt --noconfirm -S bspwm-git sxhkd-git polybar-git

RUN yaourt --noconfirm -S vi nano
RUN yaourt --noconfirm -S chromium

# Configure ZSH
RUN yaourt --noconfirm -S python-pip python-virtualenvwrapper antigen-git

# Configuration
USER root

ADD dotfiles/ /etc/skel/
RUN mv /etc/skel/startx /usr/bin/startx
RUN pip install virtualenvwrapper

# startscript to copy dotfiles from /etc/skel
# runs either CMD or image command from docker run
RUN echo -e '#! /bin/bash\n \
[ -e "$HOME/.config" ] || cp -R /etc/skel/. $HOME/ \n\
chmod 755 $HOME/.bin/*\n\
sed -i -e "s@HOMEDIR@$HOME@g" ~/.config/nitrogen/nitrogen.cfg \n\
sed -i -e "s@HOMEDIR@$HOME@g" ~/.config/nitrogen/bg-saved.cfg \n\
exec $* \n\
' > /usr/local/bin/start 
RUN chmod +x /usr/local/bin/start 

ENTRYPOINT start
CMD startx