#!/bin/sh

cd "$(dirname $0)" || exit
SOURCE_DIR="$(pwd)"
DOTFILES_DIR="$HOME/.dotfiles"

printf "Dotfiles source dir: %s\n" "$SOURCE_DIR"

if ! [ -e "$DOTFILES_DIR" ]; then
  printf "%s dose not exist.\n" "$DOTFILES_DIR"
  printf "Creat symbolic link to %s.\n" "$SOURCE_DIR"
  ln -s "$SOURCE_DIR" "$DOTFILES_DIR"
elif [ -h "$DOTFILES_DIR" ]; then
  printf "%s already exists as a symbolic link.\n" "$DOTFILES_DIR"
elif [ -d "$DOTFILES_DIR" ]; then
  printf "%s already exists as a dirctory.\n" "$DOTFILES_DIR"
else
  printf "Type of %s not handled.\n" "$DOTFILES_DIR"
fi
