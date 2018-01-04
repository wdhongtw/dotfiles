#!/bin/sh

DOTFILES_DIR="$HOME/.dotfiles"
cd $DOTFILES_DIR || exit

FILE_LIST=".screenrc .tmux.conf .vimrc .vimrc.d .bashrc.d"
install() {
  printf "Install dotfiles...\n"
  for FILE in $FILE_LIST; do
    rsync -avh --no-perms $FILE $HOME;
  done
  printf "Install completes.\n"
  printf "Create folders for vim temporary files in $HOME/.vim.\n"
  mkdir -p $HOME/.vim/{undo,swap,bakcup}
}

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
  install;
else
  printf "This may overwrite existing files in your home directory. Are you sure? (y/n) "
  read ANSWER
  if [ "$ANSWER" = "y" ]; then
    install;
  else
    printf "Install aborts.\n"
  fi
fi
