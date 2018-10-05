export TERM="xterm-256color"
export PATH="$HOME/.bin:$PATH"
export TERMINAL="urxvt"

export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export GUI_EDITOR=/usr/bin/gedit
export WORK="$HOME/work/projects/"


alias vim='nvim'
alias cdw='cd $WORK'
alias cdwp='cd $WORK/platform'
alias cdp='cd $PRIVATE'
alias cddf='cd $HOME/docker-dotfiles'

alias eyaml_edit-onfocus="eyaml edit --pkcs7-private-key=$HOME/.eyaml/private_key-onfocus.pkcs7.pem --pkcs7-public-key=$HOME/.eyaml/public_key-onfocus.pkcs7.pem"
alias eyaml_encrypt-onfocus="eyaml encrypt --pkcs7-private-key=$HOME/.eyaml/private_key-onfocus.pkcs7.pem --pkcs7-public-key=$HOME/.eyaml/public_key-onfocus.pkcs7.pem"
