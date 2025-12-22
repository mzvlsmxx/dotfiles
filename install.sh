#!/usr/bin/env bash


# sddm theme
sudo \cp -r ~/dotfiles/themes/fullblack/sddm/mzvlsmxx-sddm/ /usr/share/sddm/themes/

# other configs
\cp -r ~/dotfiles/themes/fullblack/config/* ~/.config/

# hyprland
\cp -r ~/dotfiles/hyprland/* ~/.config/hypr/

# commands
\cp -r ~/dotfiles/bin ~/

# backgrounds
\cp -r ~/dotfiles/backgrounds/ ~/.config/
