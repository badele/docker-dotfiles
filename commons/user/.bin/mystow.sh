#!/bin/bash

PWD=$(pwd)

# Check if in the dotfiles folder
if [ ! -f "$PWD/README.md" ]; then
	echo "$PWD/README.md not found, Please go to your root dotfiles folder"
	exit 0
else
	grep dotfiles "$PWD/README.md" >/dev/null
	if [ $? == 1 ]; then
		echo "'dotfiles' text not found in $PWD/README.md not found, Please go to your root dotfiles folder"
		exit 0
	fi
fi

# Execute stow
if [ ! $# -ge 2 ]; then
	echo "Usage:"
	echo "$0 simulate commons"
	echo "$0 apply dell"
	exit 0
else
	NBARGS=$(($# - 2))
	OPTS=${@:3:$NBARGS}
	MODE=${@:1:1}
	ENV=${@:2:1}

	SIMULATE=""
	if [ "$MODE" == "simulate" ]; then
		SIMULATE="-v --simulate"
	fi

	if [ -d "$PWD/$ENV/user" ]; then
		stow -d $PWD/$ENV $SIMULATE -t ~ $OPTS user

		if [ -e "$PWD/fix/$ENV/user/postscript.sh" ]; then
			$PWD/fix/$ENV/user/postscript.sh
		fi
	fi

	if [ -d "$PWD/$ENV/system" ]; then
		sudo stow -d $PWD/$ENV $SIMULATE -t / $OPTS system

		if [ -e "$PWD/fix/$ENV/system/postscript.sh" ]; then
			sudo $PWD/fix/$ENV/system/postscript.sh
		fi
	fi
fi
