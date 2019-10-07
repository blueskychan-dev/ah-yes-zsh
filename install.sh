#!/bin/sh

set -e

cd $HOME
git clone https://gitlab.com/xdevs23/ah-yes-zsh
cd ah-yes-zsh
yay -S zsh
./install.zsh
sudo chsh -s /bin/zsh

