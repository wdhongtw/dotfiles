#!/bin/sh

cd $(dirname $0)
SOURCE_DIR="$(pwd)"
DOTFILES_DIR="$HOME/.dotfiles"

printf "Dotfiles source dir: $SOURCE_DIR\n"

if ! [ -e $DOTFILES_DIR ]; then
  printf "$DOTFILES_DIR dose not exist.\n"
  printf "Creat symbolic link to $SOURCE_DIR.\n"
  ln -s $SOURCE_DIR $DOTFILES_DIR
elif [ -h $DOTFILES_DIR ]; then
  printf "$DOTFILES_DIR already exists as a symbolic link.\n"
elif [ -d $DOTFILES_DIR ]; then
  printf "$DOTFILES_DIR already exists as a dirctory.\n"
else
  printf "Type of $DOTFILES_DIR not handled.\n"
fi
