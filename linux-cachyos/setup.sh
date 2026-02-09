#!/bin/bash

GITUSERNAME=$2
GITEMAIL=$1

echo "Did you know, that you can make the setup process faster, by just using:"
echo "yes | ./setup.sh mail username"

read -p "Proceed? (Y/n): " input
confirm=${input:-y}

if [[ $confirm != [yY] ]]; then
    echo "Stopped."
    exit 0
fi

echo "Starting the setup process."

if [ $# -ne 2 ]; then
    echo "Error: [git email] [git username] arguments are missing"
    exit 1
fi    

read -p "Do you want to (re-)install the pacman packages? (Y/n): " input
confirm=${input:-y}
if [[ $confirm == [yY] ]]; then
    echo "Install essential packages:"
    sudo pacman --noconfirm -Syu yay-bin flatpak flatseal bazaar discord steam godot keepassxc owncloud-client brave-bin thunderbird git audacity texlive qemu-full libvirt dnsmasq openbsd-netcat virt-manager

    echo "Activate some deamons:"
    sudo systemctl enable libvirtd
    sudo systemctl start libvirtd
fi

read -p "Do you want to setup git? (Y/n): " input
confirm=${input:-y}
if [[ $confirm == [yY] ]]; then
    echo "Git Setup:"
    git config --global user.email "${GITEMAIL}"
    git config --global user.name "${GITUSERNAME}"
fi

read -p "Do you want to (re-)install the AUR packages? (Y/n): " input
confirm=${input:-y}
if [[ $confirm == [yY] ]]; then
    echo "Install AUR essentials:"
    yay --noconfirm -Syu vscodium-bin android-studio
fi

read -p "Do you want to setup vscodium? (Y/n): " input
confirm=${input:-y}
if [[ $confirm == [yY] ]]; then
    echo "Install codium extensions:"
    codium --install-extension Dart-Code.flutter
    codium --install-extension ms-python.python
    codium --install-extension yzhang.markdown-all-in-one
    codium --install-extension Catppuccin.catppuccin-vsc
    codium --install-extension James-Yu.latex-workshop
    codium --install-extension Gruntfuggly.todo-tree
fi

echo "Finished!"