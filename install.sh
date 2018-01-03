#!/bin/sh

DOTFILES_DIR="$HOME/.dotfiles"
cd $DOTFILES_DIR || exit

FILE_LIST=".screenrc .tmux.conf .vimrc .vim .bashrc.d"
install() {
  printf "Install dotfiles...\n"
  for FILE in $FILE_LIST; do
    rsync -avh --no-perms $FILE $HOME;
  done
  printf "Install completes.\n"
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
