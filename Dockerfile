FROM heichblatt/archlinux-yaourt

ARG REPO=https://github.com/badele/docker-dotfiles.git 

# Update
RUN yaourt --noconfirm -Syyua

# System configuration
USER root
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen

# Install some graphical packages
USER user
RUN yaourt --noconfirm -S xorg-server xorg-apps xorg-xinit xterm pulseaudio pulseaudio-ctl
RUN yaourt --noconfirm -S openssh zsh
# Python
RUN yaourt --noconfirm -S python-pip python-virtualenvwrapper 
RUN yaourt --noconfirm -S npm

USER root

RUN echo "4"
RUN cd /etc/skel && git clone $REPO 
RUN chmod 755 /etc/skel/docker-dotfiles/dotfiles_*
RUN /etc/skel/docker-dotfiles/dotfiles_install_packages

RUN echo -e '#! /bin/zsh\n \
[ -e "$HOME/docker-dotfiles" ] || cp -R /etc/skel/. $HOME/ \n\
cd $HOME/docker-dotfiles && git pull \n\
\n\
# Sudoers configuration\n\
echo x11docker | sudo --stdin su -c "echo \"$USER ALL=(ALL) NOPASSWD:ALL\"  > /etc/sudoers"\n\ 
echo x11docker | sudo --stdin su -c "echo \"root ALL=(ALL) ALL\" >> /etc/sudoers"\n\ 
\n\
# Configure user configuration by stow
cd $HOME/docker-dotfiles &&  /$HOME/docker-dotfiles/dotfiles_sync \n\

exec $* \n\
' > /usr/local/bin/start 
RUN chmod +x /usr/local/bin/start

ENTRYPOINT ["/usr/local/bin/start"]

CMD ["xterm"]
