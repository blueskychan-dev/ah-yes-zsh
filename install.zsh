#!/bin/zsh
set -e

echo "Installin ah yes zsh"

# Detect distro
if [ -f /etc/os-release ]; then
  . /etc/os-release
  DISTRO=$ID
else
  DISTRO="unknown"
fi

# Install pkgs depending on distro
case "$DISTRO" in
  arch|manjaro|endeavouros)
    if command -v yay >/dev/null 2>&1; then
      echo "Installin necesary packagez via yay"
      yay -S --noconfirm zsh git coreutils openssh thefuck
    else
      echo "Installin necesary packagez via pacman"
      sudo pacman -Sy --noconfirm zsh git coreutils openssh thefuck
    fi
    ;;
  fedora)
    echo "Installin necesary packagez via dnf"
    sudo dnf install -y zsh git coreutils openssh thefuck
    ;;
  debian|ubuntu|linuxmint|pop)
    echo "Installin necesary packagez via apt"
    sudo apt update
    sudo apt install -y zsh git coreutils openssh thefuck
    ;;
  void)
    echo "Installin necesary packagez via xbps-install"
    sudo xbps-install -Sy zsh git coreutils openssh thefuck
    ;;
  gentoo)
    echo "Installin necesary packagez via emerge"
    sudo emerge --ask --quiet zsh git coreutils openssh thefuck
    ;;
  *)
    echo "sowwy, distro '$DISTRO' not supported"
    echo "try manual install zsh, i guess"
    ;;
esac

echo "Backin up existin filez"
pushd $HOME
[ -f .zshrc ] && mv .zshrc .zshrc.lolbak
[ -f .p10k.zsh ] && mv .p10k.zsh .p10k.lolbak
[ -f .commonrc ] && mv .commonrc .commonrc.lolbak
popd

echo "Installin symlingz"
ln -s $HOME/ah-yes-zsh/.commonrc $HOME/.commonrc
ln -s $HOME/ah-yes-zsh/.zshrc $HOME/.zshrc
ln -s $HOME/ah-yes-zsh/.p10k.zsh $HOME/.p10k.zsh

echo "nice"

touch $HOME/.z
echo "yez dis gud"

