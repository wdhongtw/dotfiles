#!/usr/bin/env bash

# Enable better todo.sh UX
if which "todo.sh" >/dev/null 2>&1; then
  alias t="todo.sh -a"
  alias todo="todo.sh -a"
  complete -F _todo t
  complete -F _todo todo
fi
