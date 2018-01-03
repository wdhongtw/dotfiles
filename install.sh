#!/bin/sh

DOTFILES_DIR="$HOME/.dotfiles"
cd $DOTFILES_DIR || exit

install() {
  printf "Install dotfiles...\n"
  rsync \
    --exclude ".git/" \
    --exclude "bootstrap.sh" \
    --exclude "install.sh" \
    --exclude "README.md" \
    --exclude "ignores" \
    -avh --no-perms . $HOME;
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
