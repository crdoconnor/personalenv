#!/bin/bash
CURRENTFOLDER=$(cd `dirname $0` && pwd)
cd $CURRENTFOLDER

setuplink() {
    if [ -f ~/.$1 ] && [ "$(readlink ~/.$1)" == "$CURRENTFOLDER/$1" ] ;
    then
        echo "Existing file ~/.$1 found. Aborting!"
        exit 3
    else
        echo "Linking $1..."
        ln -s $CURRENTFOLDER/$1 ~/.$1
    fi
}

echo "CONFIGURING DOTFILES..."
setuplink tzlist
setuplink bash_profile
setuplink inputrc

echo "CONFIGURING .BASHRC..."
grep -q '. ~/personalenv/conf/bashrc_extra' ~/.bashrc || echo '. ~/personalenv/conf/bashrc_extra' >> ~/.bashrc
