#!/bin/bash

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim


echo "create .vimrc"
rm ~/.vimrc
rm ~/.gvimrc
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.gvimrc
rm ~/.gitconfig
rm ~/.latexmkrc
rm ~/.zshrc
ln -s ~/.vim/.gitconfig ~/.gitconfig
ln -s ~/.vim/.latexmkrc ~/.latexmkrc
ln -s ~/.vim/.zshrc ~/.zshrc


echo "update submodules"
git submodule init
git submodule update

echo "remove lua-ftplugin to prevent doc error msg"

rm bundle/vim-lua-ftplugin/doc/lua-ftplugin.txt

git submodule foreach git pull origin master
