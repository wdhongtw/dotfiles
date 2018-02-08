#!/bin/sh

DEST_HOME=${DEST_HOME:-"$HOME"}
cd "$(dirname "$0")" || exit

FILE_LIST=".screenrc .tmux.conf .vimrc .vimrc.d .bashrc.d"
install() {
  printf "Link dotfiles...\n"
  for FILE in $FILE_LIST; do
    ln -s -v "$(pwd)/$FILE" "$DEST_HOME";
  done
  printf "Link completes.\n"
  printf "Create folders for vim temporary files in \$HOME/.vim.\n"
  for FOLDER in undo swap backup; do
    mkdir -p -v "$DEST_HOME/.vim/$FOLDER"
  done
}

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
  install;
else
  printf "Install dotfiles into your home folder as softlinks. Are you sure? (y/n) "
  read ANSWER
  if [ "$ANSWER" = "y" ]; then
    install;
  else
    printf "Install aborts.\n"
  fi
fi
