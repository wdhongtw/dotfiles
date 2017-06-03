#!/usr/bin/env bash

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Set GOPATH for better UX
if [ ! -d $GOPATH ]; then
  mkdir -p $GOPATH/bin $GOPATH/src $GOPATH/pkg
fi

