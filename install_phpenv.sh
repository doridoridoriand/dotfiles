#!/bin/zsh

git clone https://github.com/CHH/phpenv.git
cd phpenv/bin
./phpenv-install.sh

git clone https://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build
