#!/bin/zsh

osName=`uname -s`;
# 値が1だったらCentOS 0だったらUbuntu
linuxDistoribution=`ls /etc/ | grep redhat | wc -l`

if [[ $osName -eq "Darwin" ]]; then
  brew update;
  brew lin autoconf;
  brew install rbenv ruby-build;
fi

if [[ $linuxDistoribution -eq 0 ]]; then
  sudo apt-get update;
  sudo apt-get -y install git curl g++ make;
  sudo apt-get -y install zlib1g-dev libssl-dev libreadline-dev;
  sudo apt-get -y install libyaml-dev libxml2-dev libxslt-dev:
fi

if [[ $linuxDistoribution -eq 1 ]]; then
  sudo yum install -y git gcc gcc-c++ openssl-devel readline-devel;
fi

if [[ $osName -eq "Linux" ]]; then
  git clone git://github.com/sstephenson/rbenv.git .rbenv;
  mkdir -p ~/.rbenv/plugins;
  cd ~/.rbenv/plugins;
  git clone git://github.com/sstephenson/ruby-build.git;
fi
