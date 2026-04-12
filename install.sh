#!/usr/bin/env bash

theme=''

while true; do
    read -n 1 -p $'Select theme:\n1. Main\n0. Cancel\n\n>> ' theme_num
    echo ""

    case $theme_num in
        1)
            theme='main'
            break
            ;;
        0)
            break
            exit 0
            ;;
        *)
            clear
            echo "Ошибка: '$theme_num' не подходит цифрой. Попробуйте еще раз."
            ;;
    esac
done


# sddm theme
sudo \cp -r $HOME/dotfiles/themes/$theme/sddm/mzvlsmxx-sddm/ /usr/share/sddm/themes/

# other configs
# sudo rsync -a --exclude 'hyprland' $HOME/dotfiles/themes/$theme/config/* $HOME/.config/
\cp -r $HOME/dotfiles/themes/$theme/config/* $HOME/.config/

# commands
\cp -r $HOME/dotfiles/bin $HOME/
chmod +x $HOME/*

# backgrounds
\cp -r $HOME/dotfiles/backgrounds $HOME/.config/

# reload hyprpaper
pkill hyprpaper
hyprctl dispatch exec "hyprpaper" > /dev/null

# reload waybar
killall waybar > /dev/null
hyprctl dispatch exec "waybar -c $HOME/.config/waybar/config.jsonc -s $HOME/.config/waybar/style/style.css" > /dev/null
# waybar -c $HOME/.config/waybar/config.jsonc -s $HOME/.config/waybar/style/style.css > /dev/null & disown

# zsh profile
\cp $HOME/dotfiles/.zshrc $HOME/.zshrc

# oh my zsh theme
mkdir -p $HOME/.oh-my-zsh/custom/themes
\cp $HOME/dotfiles/oh_my_zsh_themes/mzvlsmxx.zsh-theme $HOME/.oh-my-zsh/custom/themes/mzvlsmxx.zsh-theme

