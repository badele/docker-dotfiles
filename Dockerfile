# x11docker/bspwm
# 
# Run BSPWM desktop in docker. 
# Use x11docker to run image. 
# Get x11docker from github: 
#   https://github.com/mviereck/x11docker 
#
# Examples: x11docker --xephyr --user=root --pulseaudio --desktop bspwm startx

FROM heichblatt/archlinux-yaourt

# System configuration
USER root
ADD dotfiles/system/ /
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen

USER user

# Update
RUN yaourt -Syua --noconfirm

# Install some graphical packages
RUN yaourt --noconfirm -S xorg-xrandr xorg-apps numlockx compton xterm rxvt-unicode
RUN yaourt --noconfirm -S pulseaudio pavucontrol pulseaudio-ctl
RUN yaourt --noconfirm -S imlib2 feh nitrogen w3m ranger unclutter key-mon dmenu networkmanager-dmenu rofi spacefm maim dunst chromium
RUN yaourt --noconfirm -S bspwm sxhkd polybar-git ttf-material-design-icons
#RUN yaourt --noconfirm -S bspwm-git sxhkd-git polybar-git

# Install some terminal package
# vim
RUN yaourt --noconfirm -S neovim nano mpd ncmpcpp libmpdclient 

# Python
RUN yaourt --noconfirm -S python-pip python-virtualenvwrapper python-pywal termpalette-git
RUN pip install jedi pylint vim-vint
# Configure ZSH
# powerline
RUN yaourt --noconfirm -S antigen-git thefuck nerd-fonts-complete 
RUN yaourt --noconfirm -S neofetch highlight

USER root
# User configuration
ADD dotfiles/user/ /etc/skel/
RUN mv /etc/skel/startx /usr/bin/startx

# Download vim-plug

RUN mkdir -p /etc/skel/Images
RUN /etc/skel/.bin/download_wallpapers /etc/skel/Images

# Download some file in skeleton folder
RUN curl -fLo /etc/skel/.bin/doc_generate https://raw.githubusercontent.com/badele/bspwm-doc/master/doc_generate
RUN curl -fLo /etc/skel/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# startscript to copy dotfiles from /etc/skel
# runs either CMD or image command from docker run
RUN echo -e '#! /bin/zsh\n \
[ -e "$HOME/.config" ] || cp -R /etc/skel/. $HOME/ \n\
chmod 755 $HOME/.bin/*\n\
# Nitrogen configuration\n\
sed -i -e "s@HOMEDIR@$HOME@g" ~/.config/nitrogen/nitrogen.cfg \n\
sed -i -e "s@HOMEDIR@$HOME@g" ~/.config/nitrogen/bg-saved.cfg \n\
# Sudoers configuration\n\
echo x11docker | sudo --stdin su -c "echo \"$USER ALL=(ALL) NOPASSWD:ALL\"  > /etc/sudoers"\n\ 
echo x11docker | sudo --stdin su -c "echo \"root ALL=(ALL) ALL\" >> /etc/sudoers"\n\ 
exec $* \n\
' > /usr/local/bin/start 
RUN chmod +x /usr/local/bin/start 

# Clean pacman cache
RUN pacman -Scc

ENTRYPOINT ["/usr/local/bin/start"]
CMD ["startx"]
