#!/bin/bash

sudo apt install libgit2-dev curl -y

cd tmp
git clone https://github.com/getsolus/solbuild.git --depth 1
cd solbuild
make ensure_modules
make
sudo make install

cd $HOME
sudo solbuild init -u
sudo solbuild update