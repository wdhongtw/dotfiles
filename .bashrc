#!/usr/bin/env bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Enable empty list while using globbing feature
shopt -s nullglob

# Disable terminal flow control feature
stty -ixon

# Disable PROMPT_COMMAND for better UX in screen and tmux
case "$TERM" in
  screen*|tmux*)
    PROMPT_COMMAND=""
    ;;
  *)
    ;;
esac

# Set command prompt
if [ $UID -eq 0 ]; then
  PS1="\[$(tput bold)$(tput setaf 1)\][\u@\h \W]\$\[$(tput sgr0)\] "
else
  PS1="\[$(tput bold)$(tput setaf 2)\][\u@\h \W]\$\[$(tput sgr0)\] "
fi

# Short Commands
alias view="vim -R"
alias gdb="gdb -q"
alias grep="grep -i --color=auto"
alias rm="rm -i"
alias ll="ls -al"
if which journalctl >/dev/null 2>&1; then
  alias journalctl="journalctl -e"
fi

# Set default pager and editor
export PAGER="less -s"
export LESS="-i -M -R +Gg"
export EDITOR="vim"

# Set locale environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Enable user-specific host alias
export HOSTALIASES="$HOME/.hosts"

# Remove duplicated command history record
export HISTCONTROL=ignoreboth:erasedups

# Source definitions within $HOME/.bashrc.d folder
for file in $HOME/.bashrc.d/*.bash; do
  # shellcheck disable=SC1090
  . "$file"
done
