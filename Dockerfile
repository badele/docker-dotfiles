# x11docker/bspwm
# 
# Run BSPWM desktop in docker. 
# Use x11docker to run image. 
# Get x11docker from github: 
#   https://github.com/mviereck/x11docker 
#
# Examples: x11docker --xephyr --user=root --pulseaudio --desktop bspwm startx

FROM heichblatt/archlinux-yaourt

# Yaourt must be run in user mode
USER user

# Update
RUN yaourt --noconfirm -Syyua

# System configuration
USER root
ADD dotfiles/system/ /
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen

# Install some graphical packages
USER user
RUN yaourt --noconfirm -S nerd-fonts-complete 
RUN yaourt --noconfirm -S xorg-xrandr xorg-apps xdo numlockx compton xterm rxvt-unicode termite
RUN yaourt --noconfirm -S pulseaudio pavucontrol pulseaudio-ctl
RUN yaourt --noconfirm -S imlib2 feh nitrogen w3m unclutter key-mon dmenu networkmanager-dmenu-git rofi spacefm maim dunst dunstify 
RUN yaourt --noconfirm -S bspwm sxhkd polybar-git ttf-material-design-icons chromium
#RUN yaourt --noconfirm -S bspwm-git sxhkd-git polybar-git

# Install some terminal package
RUN yaourt --noconfirm -S ranger neovim ripgrep tty-clock mpd ncmpcpp libmpdclient 

# Python
RUN yaourt --noconfirm -S python-pip python-neovim python-virtualenvwrapper python-pywal termpalette-git
RUN yaourt --noconfirm -S npm

USER root
# For Vim package
RUN npm i -g npm@5.6.0 # Fix temporary npm
RUN pip install jedi pylint vim-vint
RUN npm install -g fixjson jsonlint

USER user

# Configure ZSH
# powerline
RUN yaourt --noconfirm -S antigen-git thefuck nerd-fonts-complete 
RUN yaourt --noconfirm -S neofetch highlight
RUN yaourt --noconfirm -S shfmt
RUN yaourt --noconfirm -S imagemagick

# User configuration
USER root
# Add user skeleton
RUN mkdir -p /etc/skel/Images
RUN pwd
ADD dotfiles/user/ /etc/skel/
RUN mv /etc/skel/startx /usr/bin/startx
#RUN /etc/skel/.bin/download_wallpapers /etc/skel/Images
RUN  convert "https://static.pexels.com/photos/540518/pexels-photo-540518.jpeg" -strip -resize "1920x1080^" "/etc/skel/Images/wallpaper.jpg"
RUN  convert "http://www.tokkoro.com/picsup/427348-anonymous-hd-widescreen-wallpapers-backgrounds.jpeg" -strip -resize "1920x1080^" "/etc/skel/Images/anonymous1_tokkoro.jpg"
RUN  convert "http://www.tokkoro.com/picsup/2986141-anonymous-face-mask-minimalism-guy-fawkes-mask-hope-posters___mixed-wallpapers.jpg" -strip -resize "1920x1080^" "/etc/skel/Images/wanonymous2_tokkoro.jpg"

# Download some file in skeleton folder
#RUN curl -fLo /etc/skel/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
