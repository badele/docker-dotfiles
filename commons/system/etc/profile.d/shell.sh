#!/bin/bash

# then export ~/bin to your $PATH.
if [[ $UID -ge 1000 && -d $HOME/.bin && -z $(echo $PATH | grep -o $HOME/.bin) ]]
then
    export PATH="${PATH}:$HOME/.bin"
fi

