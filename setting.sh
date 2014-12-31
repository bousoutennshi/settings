#!/bin/sh

cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig
cp jshintrc ~/.jshintrc
source ~/.bashrc
if [ ! -e ~/.vim ]; then
    mkdir ~/.vim
fi
if [ ! -e ~/.vim/vundle.git ]; then
    mkdir ~/.vim/vundle.git
    git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git
fi
