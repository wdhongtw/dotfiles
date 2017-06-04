#!/usr/bin/env bash

# Set GOPATH and PATH for better UX
if [ -z "$GOPATH" ]; then
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOPATH/bin
fi

# Create basic directories for GOPATH
if [ ! -d $GOPATH ]; then
  mkdir -p $GOPATH/bin $GOPATH/src $GOPATH/pkg
fi

