# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

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
alias grep="grep -i"
alias rm="rm -i"
alias ll="ls -al"

# Allow colorful man page
export GROFF_NO_SGR="1"

# Set color of less pager
export LESS_TERMCAP_mb="$(tput bold)$(tput setaf 1)"
export LESS_TERMCAP_md="$(tput bold)$(tput setaf 4)"
export LESS_TERMCAP_me="$(tput sgr0)"
export LESS_TERMCAP_so="$(tput rev)"
export LESS_TERMCAP_se="$(tput sgr0)"
export LESS_TERMCAP_us="$(tput bold)$(tput smul)$(tput setaf 2)"
export LESS_TERMCAP_ue="$(tput sgr0)"

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
