# Powerline
#powerline-daemon -q
#. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# Antigen configuration
source /usr/share/zsh/share/antigen.zsh
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time load os_icon)

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle docker
antigen bundle thefuck
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
# FZF is installed from archlinux distribution package manager

# Load the theme.
#antigen theme robbyrussell
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell Antigen that you're done.
antigen apply

# Disable Ctrl-S (freeze terminal)
stty -ixon -ixoff

# FZF plugin configuration
source ~/.fzf-custom.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

show_tips
