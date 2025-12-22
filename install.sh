#!/usr/bin/env bash


# sddm theme
sudo \cp -r ~/dotfiles/themes/fullblack/sddm/mzvlsmxx-sddm/ /usr/share/sddm/themes/

# other configs
\cp -r ~/dotfiles/themes/fullblack/config/* ~/.config/

# commands
cp -r ~/dotfiles/bin ~/
