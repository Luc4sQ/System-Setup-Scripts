#!/bin/bash

echo "Install essential packages:"
sudo pacman --noconfirm -Syu yay-bin flatpak flatseal bazaar discord steam godot keepassxc owncloud-client brave-bin thunderbird git audacity texlive qemu-full


echo "Install AUR essentials:"
yay --noconfirm -Syu vscodium-bin android-studio


echo "Install codium extensions:"
codium --install-extension Dart-Code.flutter
codium --install-extension ms-python.python
codium --install-extension yzhang.markdown-all-in-one
codium --install-extension Catppuccin.catppuccin-vsc
codium --install-extension James-Yu.latex-workshop
codium --install-extension Gruntfuggly.todo-tree