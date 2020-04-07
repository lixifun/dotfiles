#! /usr/bin/env bash

set -e
set -x

ETC=~/.local/etc
mkdir -p $ETC

# clone this repository
cd ~/.local/
if [ -d dotfiles ]; then
    cd dotfiles
    git pull
else
    git clone https://github.com/lixifun/dotfiles.git
    cd dotfiles
fi

cp -rf etc/* $ETC/

# source vimrc.vim
touch ~/.vimrc
sed -i "\:$ETC/vimrc.vim:d" ~/.vimrc
echo "source $ETC/vimrc.vim" >> ~/.vimrc

# source init.sh
if [ -n $BASH_VERSION ]; then
    echo "source $ETC/init.sh" >> ~/.bashrc
fi

if [ -n $ZSH_VERSION ]; then
    echo "source $ETC/init.sh" >> ~/.zshrc
fi

source $ETC/init.sh
