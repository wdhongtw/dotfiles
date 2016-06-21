# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment this line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Disable PROMPT_COMMAND for better UX in screen and tmux
case "$TERM" in
screen*|tmux*)
    PROMPT_COMMAND=""
    ;;
*)
    ;;
esac

# Set command prompt
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

# Short Commands
alias view="vim -R"
alias gdb="gdb -q"
alias grep="grep -i"
alias rm="rm -i"
alias ll="ls -al"

# Allow colorful man page
export GROFF_NO_SGR="1"

# Set color of less pager
export LESS_TERMCAP_mb=$(printf "\e[1;91m")
export LESS_TERMCAP_md=$(printf "\e[1;94m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[7m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[1;4;92m")
export LESS_TERMCAP_ue=$(printf "\e[0m")

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
