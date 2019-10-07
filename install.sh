#!/bin/sh

set -e

cd $HOME
git clone https://gitlab.com/xdevs23/ah-yes-zsh
cd ah-yes-zsh
yay -S --noconfirm zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

./install.zsh
sudo chsh -s /bin/zsh
zsh


