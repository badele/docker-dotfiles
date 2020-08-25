export TERM="xterm-256color"
export PATH="$HOME/.bin:$HOME/go/bin:$PATH"
export TERMINAL="urxvt"

export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export GUI_EDITOR=/usr/bin/gedit
export WORK="$HOME/work/projects"
export PRIVATE="$HOME/private/projects"
export GOPATH="$HOME/go"
export BROWSER="google-chrome-stable"

alias vim='nvim'
alias cdw='cd $WORK'
alias cdwp='cd $WORK/platform'
alias cdp='cd $PRIVATE'
alias cdpd='cd $PRIVATE/docker-dotfiles'

alias eyaml_edit-onfocus="eyaml edit --pkcs7-private-key=$HOME/.eyaml/private_key-onfocus.pkcs7.pem --pkcs7-public-key=$HOME/.eyaml/public_key-onfocus.pkcs7.pem"
alias eyaml_encrypt-onfocus="eyaml encrypt --pkcs7-private-key=$HOME/.eyaml/private_key-onfocus.pkcs7.pem --pkcs7-public-key=$HOME/.eyaml/public_key-onfocus.pkcs7.pem"
alias grunnerstart="gcloud --project adagio-grunner-3b965aa7 compute instances start gitlab-ci-runner-0 --zone europe-west4-a"
alias grunnerstop="gcloud --project adagio-grunner-3b965aa7 compute instances stop gitlab-ci-runner-0 --zone europe-west4-a"

alias gprod="gcloud --project adagio-prod compute instances list"
alias gstaging="gcloud --project adagio-vrac compute instances list"
alias gtesting="gcloud --project adagio-testing-cfa18295 compute instances list"

GCPPROJECTS="""testing:adagio-testing-cfa18295
staging:adagio-vrac
prod:adagio-prod
"""

function getProjectId {
    echo ${GCPPROJECTS} | grep $1 | cut -d":" -f2
}

# List hosts
function glhosts {
    gcloud --project $(getProjectId $1) compute instances list --filter="name~'.*$2.*'"
}

# Search hosts
function gshosts {
  gcloud --project $(getProjectId $1) compute instances list --sort-by NAME --format="value(networkInterfaces[0].networkIP,creationTimestamp,name,status)" --sort-by=~creationTimestamp --filter="name~'.*$2.*'"
}


function gssh {
  IP=$(gcloud --project $(getProjectId $1) compute instances list --sort-by NAME --format="value(networkInterfaces[0].networkIP)" --sort-by=~creationTimestamp --filter="name~'.*$2.*' AND status='RUNNING'" | head -n 1 | cut -f1)
  ssh root@$IP
}

function gsshk {
  IPS=$(gcloud --project $(getProjectId $1) compute instances list --sort-by NAME --format="value(networkInterfaces[0].networkIP)" --sort-by=~creationTimestamp --filter="name~'.*$2.*' AND status='RUNNING'")
  NBLINES=$(echo $IPS | wc -l)
  SELECTEDLINE=$(shuf -i1-${NBLINES} -n1)

  IP=$(echo $IPS | sed -n ${SELECTEDLINE}p | cut -f1)
  ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$IP
}

function gclustersshk {
  IPS=$(gcloud --project $(getProjectId $1) compute instances list --sort-by NAME --format="value(networkInterfaces[0].networkIP)" --sort-by=~creationTimestamp --filter="name~'.*$2.*' AND status='RUNNING'" | cut -f1)
  while read -r IP
  do
    ssh -n -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$IP "$3"
  done < <(printf '%s\n' "$IPS")
}
