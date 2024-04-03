#!/bin/bash

# Update and install build dependencies
sudo apt update
sudo apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# Clone Neovim repo
git clone https://github.com/neovim/neovim.git
cd neovim

# Checkout the stable branch for the latest stable version
git checkout stable

# Build Neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# Return to the original directory
cd ..

echo "Neovim installation is complete."

