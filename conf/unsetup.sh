#!/bin/bash
CURRENTFOLDER=$(cd `dirname $0` && pwd)
cd $CURRENTFOLDER

unsetuplink() {
    if [ -f ~/.$1 ] && [ "$(readlink ~/.$1)" == "$CURRENTFOLDER/$1" ] ;
    then
        echo "Existing symlink file ~/.$1 found. Deleting."
        rm ~/.$1
    else
        echo "File ~/.$1 was not found or was not symlink. Aborting!"
        exit 3
    fi
}

echo "UNCONFIGURING DOTFILES..."
unsetuplink tzlist
unsetuplink bash_profile
unsetuplink inputrc

echo "UNCONFIGURING .BASHRC..."
sed -i '/\. \~\/deskenv\/conf\/bashrc_extra/d' ~/.bashrc
