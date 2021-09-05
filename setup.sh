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

echo "::group::write packager configuration file"
cd $HOME && mkdir -p .solus
echo "[Packager]
Name=$1
Email=$2" > $HOME/.solus/packager
cat $HOME/.solus/packager
echo "::endgroup::"

echo "::group::init solbuild"
rm -rf /tmp/solbuild
sudo solbuild init -u
sudo solbuild update
echo "::endgroup::"