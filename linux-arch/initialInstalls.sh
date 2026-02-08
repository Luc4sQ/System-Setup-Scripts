#!/bin/bash

echo "Update all packages first."
sudo pacman -Syu

echo "Install essential packages:"
sudo pacman -S flatpak flatseal bazaar discord steam godot keepassxc owncloud-client brave-bin thunderbird git audacity

echo "Install AUR essentials:"
yay -S vscodium-bin android-studio

