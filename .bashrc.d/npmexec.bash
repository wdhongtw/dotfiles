#!/usr/bin/env bash

# Provide a consistent way to use npm executables
if which "npm" >/dev/null 2>&1; then
  alias npmexec='PATH=$(npm bin):$PATH'
fi
