#!/bin/bash

# install lf-git
yay -S lf-git

# Install the desktop file
sudo desktop-file-install lf.desktop

# Tell xdg to use the desktop file for the magnet MIME type
xdg-mime default lf.desktop inode/directory

