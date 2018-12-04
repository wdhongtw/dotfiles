#!/usr/bin/env bash

# Set color of less pager
LESS_TERMCAP_mb="$(tput bold)$(tput setaf 1)"
LESS_TERMCAP_md="$(tput bold)$(tput setaf 4)"
LESS_TERMCAP_me="$(tput sgr0)"
LESS_TERMCAP_so="$(tput rev)"
LESS_TERMCAP_se="$(tput sgr0)"
LESS_TERMCAP_us="$(tput bold)$(tput smul)$(tput setaf 2)"
LESS_TERMCAP_ue="$(tput sgr0)"

export LESS_TERMCAP_mb
export LESS_TERMCAP_md
export LESS_TERMCAP_me
export LESS_TERMCAP_so
export LESS_TERMCAP_se
export LESS_TERMCAP_us
export LESS_TERMCAP_ue
