
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
./commons/user/.bin/dotfiles_install_bootstrap
./commons/user/.bin/dotfiles_install_commons
./commons/user/.bin/dotfiles_get_for_computer
```

[For more help](https://raw.githubusercontent.com/badele/docker-dotfiles/master/commons/user/.config/nvim/doc/help.txt)

### Sample

**Note :** Some of these videos were made with `screenkey`, `video_record_desktop`, `video_record_stop`, `video_to_gif`

#### Themes

**desktop_theme_from_image command line** A dedicated tool for setting a themes from picture

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/theme-script-desktop.gif.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/theme-script-desktop.gif" alt="desktop_theme_from_image" width="50%"></a>

**from `ranger` file manager** It's possible preview picture from ranger(terminal)

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/theme-ranger-desktop.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/theme-ranger-desktop.gif" alt="ranger" width="50%"></a>

#### ZSH

**FZF** Command-line fuzzy finder (search folder and mores)

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/fzf-search.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/fzf-search.gif" alt="fzf-search" width="50%"></a>

#### Vim

**auto plugin installation** First time, plugins installed automatically

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim-plug.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim-plug.gif" alt="vim-plugin" width="50%"></a>


**startify plugin** Last VIM session files

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim-startify.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim-startify.gif" alt="vim-startify" width="50%"></a>

**FZF Files** Search files from current project

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim_fzf_files.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim_fzf_files.gif" alt="vim-fzf-files" width="50%"></a>

**FZF Contents** Search content in you current project

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim_fzf_contents.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim_fzf_contents.gif" alt="vim-fzf-files" width="50%"></a>

**Search & Replace with ferret** Search and replace content

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim_search_replace.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim_search_replace.gif" alt="vim-search-replace" width="50%"></a>

**Colorize hex color** Colorize color in the code with hex color

<a href="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim_colorizer.gif"><img src="https://raw.githubusercontent.com/badele/docker-dotfiles/master/images/vim_colorizer.gif" alt="vim-search-replace" width="50%"></a>

### TODO

- [ ] Configure MPD player
