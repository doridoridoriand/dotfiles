#!/bin/zsh

osName=`uname -s`;

if [[ $osName -eq "Darwin" ]]; then
  brew update;
  brew install pyenv;
fi

if [[ $osName -eq "Linux" ]]; then
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv;
fi
