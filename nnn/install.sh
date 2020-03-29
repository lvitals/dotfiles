#!/bin/bash

# install nnn
sudo pacman -S nnn

# Install the desktop file
sudo desktop-file-install nnn.desktop

# Tell xdg to use the desktop file for the magnet MIME type
xdg-mime default nnn.desktop inode/directory

