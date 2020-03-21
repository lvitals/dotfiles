#!/bin/bash

# install transmission-cli and xterm
sudo pacman -S transmission-cli # xterm

# Install the shell script transmission
sudo cp transmission /usr/local/bin/ 
sudo chmod +x /usr/local/bin/transmission

# Install the desktop file
sudo desktop-file-install transmission.desktop

# Tell xdg to use the desktop file for the magnet MIME type
xdg-mime default transmission.desktop x-scheme-handler/magnet

