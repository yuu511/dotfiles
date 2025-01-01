#!/bin/sh
#lazy vim install script

sudo apt install ripgrep exuberant-ctags
cp .vimrc ~/.vimrc
mkdir -p ~/.vim/autoload && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim && mkdir -p ~/.vim/bundle && cd ~/.vim/bundle
git clone https://github.com/ludovicchabant/vim-gutentags.git
git clone https://github.com/jremmen/vim-ripgrep.git
git clone https://github.com/tpope/vim-vinegar.git
git clone https://github.com/christoomey/vim-tmux-navigator.git
cp .tmux.conf ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
