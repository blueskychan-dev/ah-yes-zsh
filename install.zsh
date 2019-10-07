#!/bin/zsh

set -e

echo "Installin ah yes zsh"

if hash yay 2>/dev/null >/dev/null; then

  echo "Installin necesary packagez"
  yay -S \
    netkit-bsd-finger git coreutils openssh \
    thefuck

else
  echo "sowwy u no has yay installed"
fi

echo "Backin up existin filez"
pushd $HOME
[ -f .zshrc ] && mv .zshrc .zshrc.lolbak
[ -f .p10k.zsh ] && mv .p10k.zsh .p10k.zsh.lolbak
[ -f .commonrc ] && mv .commonrc .commonrc.lolbak
popd

echo "Installin symlingz"
ln -s $HOME/ah-yes-zsh/.commonrc $HOME/ah-yes-zsh/.zshrc $HOME/ah-yes-zsh/.p10k.zsh $HOME/.

echo "yez dis gud"

