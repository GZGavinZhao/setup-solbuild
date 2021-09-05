#!/bin/bash

echo "::group::install dependencies"
sudo apt install libgit2-dev libcurl4-openssl-dev -y
echo "::endgroup::"

echo "::group::clone solbuild"
cd /tmp
git clone https://github.com/getsolus/solbuild.git --depth 1
cd solbuild
echo "::endgroup::"

echo "::group::build solbuild"
make
echo "::endgroup::"
echo "::group::install solbuild"
sudo make install
echo "::endgroup::"

echo "::group::init solbuild"
cd $HOME
sudo solbuild init -u
sudo solbuild update
echo "::endgroup::"