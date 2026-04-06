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
            ;;
        *)
            clear
            echo "Ошибка: '$theme_num' не подходит цифрой. Попробуйте еще раз."
            ;;
    esac
done

# case $theme_num in
#     # 2|3)
#     #     echo "Вы выбрали два или три"
#     #     ;;
#     # [4-7])
#     #     echo "Вы выбрали цифру от 4 до 7"
#     #     ;;
#     # 0|8|9)
#     #     echo "Вы выбрали 0, 8 или 9"
#     #     ;;
#     *)
#         echo "Это не цифра или ввод пуст"
#         ;;
# esac



# sddm theme
sudo \cp -r ~/dotfiles/themes/$theme/sddm/mzvlsmxx-sddm/ /usr/share/sddm/themes/

# other configs
\cp -r ~/dotfiles/themes/$theme/config/* ~/.config/

# hyprland
\cp -r ~/dotfiles/themes/$theme/config/hyprland/* ~/.config/hypr/

# commands
\cp -r ~/dotfiles/bin ~/
chmod +x ~/*

# backgrounds
\cp -r ~/dotfiles/backgrounds/ ~/.config/

# reload hyprpaper
sh -c "pkill hyprpaper; hyprpaper > /dev/null & disown"

# zsh profile
\cp ~/dotfiles/.zshrc ~/.zshrc

# oh my zsh theme
mkdir -p ~/.oh-my-zsh/custom/themes
\cp ~/dotfiles/oh_my_zsh_themes/mzvlsmxx.zsh-theme ~/.oh-my-zsh/custom/themes/mzvlsmxx.zsh-theme

