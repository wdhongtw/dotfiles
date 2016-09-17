#!/bin/sh

DOTFILES_DIR="$HOME/.dotfiles"
cd $DOTFILES_DIR

install() {
  printf "Install dotfiles...\n"
  rsync \
    --exclude ".git/" \
    --exclude "bootstrap.sh" \
    --exclude "install.sh" \
    --exclude "README.md" \
    -avh --no-perms . $HOME;
  printf "Install completes.\n"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  install;
else
  WARN_MSG="This may overwrite existing files in your home directory. Are you sure? (y/n) "
  read -p "$WARN_MSG" ANSWER
  if [ "$ANSWER" == "y" ]; then
    install;
  else
    printf "Install aborts.\n"
  fi
fi
