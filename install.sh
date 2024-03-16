#!/bin/sh

set -e

cd $HOME
git clone https://github.com/windowz414/ah-yes-zsh
cd ah-yes-zsh
yay -S --noconfirm zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh -c "git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k"

./install.zsh
sudo chsh -s /bin/zsh $USER
zsh


