
```
                ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
                ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
                ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
                ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
                ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
                ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
                
                               For Manjaro/Archlinux distribution
```

## Installation

### Docker Installation

```bash
cd
git clone git@github.com:badele/docker-dotfiles.git
cd docker-dotfiles
/run.sh
```

### Physical Installation

```bash
cd
git clone git@github.com:badele/docker-dotfiles.git
cd docker-dotfiles
./commons/user/.bin/dotfiles_install_packages
./commons/user/.bin/dotfiles_get_conf4computer
```

[For more help](https://raw.githubusercontent.com/badele/docker-dotfiles/master/commons/user/.config/nvim/doc/help.txt)

### Sample

#### Themes

**desktop_theme_from_image command line** A dedicated tool for setting a themes from picture

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/theme-script-desktop.gif.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/theme-script-desktop.gif" alt="desktop_theme_from_image" width="50%"></a>

**from `ranger` file manager**

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/theme-ranger-desktop.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/theme-ranger-desktop.gif" alt="ranger" width="50%"></a>

#### Vim

**auto plugin installation**

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim-plug.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim-plug.gif" alt="vim-plugin" width="50%"></a>


**startify plugin**

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim-startify.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim-startify.gif" alt="vim-startify" width="50%"></a>


### TODO

- [ ] Configure MPD player
