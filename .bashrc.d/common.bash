#!/usr/bin/env bash
# .bashrc

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

# Short Commands
alias view="vim -R"
alias gdb="gdb -q"
alias grep="grep -i --color=auto"
alias rm="rm -i"
alias ll="ls -al"

# Set default pager and editor
export PAGER="less -s"
export LESS="-i -M -R +Gg"
export EDITOR="vim"

# Enable user-specific host alias
export HOSTALIASES="$HOME/.hosts"

# Remove duplicated command history record
export HISTCONTROL=ignoreboth:erasedups

# Source definitions within $HOME/.bashrc.d folder
for file in $HOME/.bashrc.d/*.bash; do
  . "$file"
done
