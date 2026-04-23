# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to custom scripts
export PATH="$HOME/bin:$PATH"

# Venv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME="mzvlsmxx"

plugins=(git virtualenv)

source $ZSH/oh-my-zsh.sh

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mzvlsmxx/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec start-hyprland
fi