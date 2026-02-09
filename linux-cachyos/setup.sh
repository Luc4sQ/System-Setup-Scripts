#!/bin/bash

echo "Starting the setup process."

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
    read -p "Enter e-mail: " mail
    git config --global user.email "$mail"
    read -p "Enter username: " user
    git config --global user.name "$user"
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