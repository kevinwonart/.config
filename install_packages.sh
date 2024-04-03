#!/bin/bash

# Get Updated package list : "dpkg --get-selections > installed_packages.txt"
# Update repository and upgrade packages
sudo apt-get update && sudo apt-get upgrade -y

# Install packages from a list
while read package; do
  sudo apt-get install -y "$package"
done < installed_packages.txt

# Copy configuration files to home directory
cp .bashrc .Xmodmap .gitconfig .tmux.conf ~/

echo "Installed packages complete and configuration files copied."
