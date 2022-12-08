#!/bin/bash
VIMRC="$(pwd)/.vimrc"
TMUXCONF="$(pwd)/.tmux.conf"
cd ~ 
echo "Making symbolic links in $(pwd)" 
ln -nfs $VIMRC .vimrc 
ln -nfs $TMUXCONF .tmux.conf
