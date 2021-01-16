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
alias cdg='cd $(git rev-parse --show-toplevel)'
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
adagio-vrac:adagio-vrac
staging:adagio-staging-8b11f5ec
prod:adagio-prod
"""

function getProjectId {
    echo "${GCPPROJECTS}" | egrep "^$1:" | cut -d":" -f2
}

function gsync {

  if [ -z "$1" ];then
      echo "Usage: $0 <ENV> [USERNAME](default: root)"
      return 1
  fi

  if [ -z $2 ]; then
    username="root"
  else
    username=$2
  fi

  # Get hosts list
  gcloud --project $(getProjectId $1) compute instances list --filter="status='RUNNING'" --format="csv[no-heading,separator=' '](name,networkInterfaces.networkIP,networkInterfaces.accessConfigs.natIP)" | sed "s/\[u'//" | sed "s/'\]//" > /tmp/gssh-${1}-hosts

  # Store user login account
  echo "$username" > /tmp/gssh-${1}-username
}


function glhosts {
  if [ -z "$1" ];then
      echo "Usage: $0 <ENV> [FILTER](default: all hosts)"
      return 1
  fi

  # If hosts file list not exist create it
  if [ ! -f /tmp/gssh-${1}-hosts ]; then
    gsync $1 $2
  fi

  FILENAME="/tmp/gssh-${1}-hosts"

  # Show cache time
  if [[ "_$(uname)_" == "_Darwin_" ]] ; then
    stat -f "%Sm" $FILENAME
  else
    stat -c "%y" $FILENAME
  fi

  echo ""
  cat $FILENAME | egrep ".*$2.*" | column -t
}

# Connect via VPN
function __gssh {

  if [ -z "$2" ];then
      echo "Usage: gssh <ENV> [FILTER] [COMMAND]"
      return 1
  fi

  # If hosts file list not exist create it
  if [ ! -f /tmp/gssh-${1}-hosts ]; then
    gsync $1 $2
  fi

  username=$(cat /tmp/gssh-${1}-username)
  bastion=$(cat /tmp/gssh-${1}-hosts | grep bastion | cut -d " " -f3)
  HOSTS=$(cat /tmp/gssh-${1}-hosts | grep ${2})
  NBLINES=$(echo ${HOSTS} | wc -l)
  SELECTEDLINE=$(shuf -i1-${NBLINES} -n1)
  IP=$(echo ${HOSTS} | sed -n ${SELECTEDLINE}p | cut -d " " -f2)

  if [[ "_${IP}_" == "__" ]]; then
    echo "Hostname not found, refresh cache"
    gsync $1

    HOSTS=$(cat /tmp/gssh-${1}-hosts | grep ${2})
    NBLINES=$(echo ${HOSTS} | wc -l)
    SELECTEDLINE=$(shuf -i1-${NBLINES} -n1)
    IP=$(echo ${HOSTS} | sed -n ${SELECTEDLINE}p | cut -d " " -f2)

    if [[ "_${IP}_" == "__" ]]; then
      echo "Can't found a hostname"
      return 1
    fi
  fi

  # Test host availability
  ping -c1 -w1 $IP > /dev/null
  if [ $? -ne 0 ]; then
    echo "Can't ping host, refresh ssh cache"
    gsync $1
  fi

  # Connect to SSH terminal
  if [ -z "$bastion" ]; then
    ssh -o ConnectTimeout=5 ${SSHOPTIONS} root@$IP $3
  else
    ssh ${SSHOPTIONS} -o "ProxyCommand ssh -W %h:%p ${SSHOPTIONS} $bastion" ${username}@$IP "$3"
  fi
}

function gssh {
  SSHOPTIONS=()
  __gssh $1 $2 $3
}

function gsshk {
  SSHOPTIONS=(-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o CheckHostIP=no)
  __gssh $1 $2 $3
}

function gclustersshk {
  username=$(cat /tmp/gssh-${1}-username)
  bastion=$(cat /tmp/gssh-${1}-hosts | grep bastion | cut -d " " -f3)
  IPS=$(cat /tmp/gssh-${1}-hosts | grep ${2} | cut -d" " -f2)

  while read -r IP
  do
    echo "$IP"
    if [ -z "$bastion" ]; then
      ssh -n -o ConnectTimeout=1 -o BatchMode=yes -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o CheckHostIP=no root@$IP "$3" || if [ $? -eq 255 ]; then echo "\n===============================\n= please use 'gsync' command\n===============================\n"; fi
    else
      # TODO actually loop not working
      ssh -o ConnectTimeout=1 -o BatchMode=yes ${SSHOPTIONS} -o "ProxyCommand ssh -W %h:%p ${SSHOPTIONS} $bastion" ${username}@$IP "$3" || if [ $? -eq 255 ]; then echo "\n===============================\n= please use 'gsync' command\n===============================\n"; fi
    fi
  done < <(printf '%s\n' "$IPS")
}
