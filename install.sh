#!/bin/sh
set -e

install_zsh() {
    if command -v zsh >/dev/null 2>&1; then
        echo "zsh already installed, skipping..."
    else
        if [ -f /etc/arch-release ]; then
            sudo pacman -Sy --noconfirm zsh
        elif [ -f /etc/debian_version ]; then
            sudo apt update && sudo apt install -y zsh
        elif [ -f /etc/fedora-release ]; then
            sudo dnf install -y zsh
        elif [ -f /etc/void-release ]; then
            sudo xbps-install -Sy zsh
        else
            echo "Unknown distro. Please install zsh manually."
            exit 1
        fi
    fi
}

cd "$HOME"
git clone https://github.com/blueskychan-dev/ah-yes-zsh
cd ah-yes-zsh

install_zsh

echo -e "NOTICE: After switching to zsh, please type 'exit' to let installer continue :p"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh -c "git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k"

./install.zsh
sudo chsh -s /bin/zsh "$USER"
zsh
