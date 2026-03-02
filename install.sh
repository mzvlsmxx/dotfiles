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

# zsh profile
\cp ~/dotfiles/.zshrc ~/.zshrc

# oh my zsh theme
mkdir -p ~/.oh-my-zsh/custom/themes
\cp ~/dotfiles/oh_my_zsh_themes/mzvlsmxx.zsh-theme ~/.oh-my-zsh/custom/themes/mzvlsmxx.zsh-theme

