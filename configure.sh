#!/bin/bash
DOTDIR="$(pwd)"
VIMRC="$(pwd)/.vimrc"
TMUXCONF="$(pwd)/.tmux.conf"
cd ~ 
echo "Making symbolic links in $(pwd)" 
ln -nfs $VIMRC .vimrc 
ln -nfs $TMUXCONF .tmux.conf

# Set up vundle for vim
VUNDLEDIR="$(readlink -f ~/.vim/bundle/Vundle.vim)"
if [ -d "$VUNDLEDIR" ]; then
    echo "vundle repo exists, updating repo"
    cd $VUNDLEDIR
    git pull 
    cd $DOTDIR
else
    echo "vundle repo does not exis, cloning git repo"
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLEDIR"
fi
# Installing plugins in .vimrc
vim +PluginInstall +qall
