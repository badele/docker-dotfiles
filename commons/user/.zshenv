export TERM="xterm-256color"
export PATH="$HOME/.bin:$HOME/go/bin:$PATH"
export TERMINAL="urxvt"

export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export GUI_EDITOR=/usr/bin/gedit
export WORK="$HOME/work/projects"
export PRIVATE="$HOME/private/projects"
export GOPATH="$HOME/go"

alias vim='nvim'
alias cdw='cd $WORK'
alias cdwp='cd $WORK/platform'
alias cdp='cd $PRIVATE'
alias cdpd='cd $PRIVATE/docker-dotfiles'

alias eyaml_edit-onfocus="eyaml edit --pkcs7-private-key=$HOME/.eyaml/private_key-onfocus.pkcs7.pem --pkcs7-public-key=$HOME/.eyaml/public_key-onfocus.pkcs7.pem"
alias eyaml_encrypt-onfocus="eyaml encrypt --pkcs7-private-key=$HOME/.eyaml/private_key-onfocus.pkcs7.pem --pkcs7-public-key=$HOME/.eyaml/public_key-onfocus.pkcs7.pem"
alias grunnerstart="gcloud --project adagio-grunner-3b965aa7 compute instances start gitlab-ci-runner-0 --zone europe-west4-a"
alias grunnerstop="gcloud --project adagio-grunner-3b965aa7 compute instances stop gitlab-ci-runner-0 --zone europe-west4-a"
