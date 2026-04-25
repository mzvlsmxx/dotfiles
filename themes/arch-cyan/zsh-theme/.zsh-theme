# Based on bira theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

local color_primary='#00FFFF'
local color_error='#AA0000'
local color_dir='#FFFFFF'
local color_venv='#FFFFFF'


# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER="%F{$color_primary}%n%f"
  PR_USER_OP="%F{$color_primary}%#%f"
  PR_PROMPT='%f➤ %f'
else # root
  PR_USER="%F{$color_error}%n%f"
  PR_USER_OP="%F{$color_error}%#%f"
  PR_PROMPT="%F{$color_error}➤ %f"
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST="%F{$color_error}%M%f" # SSH
else
  PR_HOST="%F{$color_primary}%m%f" # no SSH
fi


local return_code="%(?..%F{$color_error}%?%f)"

local user_host="${PR_USER}%F{$color_primary}@${PR_HOST}"
local current_dir="%B%F{$color_dir}%~%f%b"
local git_branch='$(git_prompt_info)'
local venv_prompt='%F{white}$(virtualenv_prompt_info)%f'

# PROMPT="╭─${venv_prompt}${user_host} ${current_dir} \$(ruby_prompt_info) ${git_branch}
# ╰─$PR_PROMPT "
PROMPT="╭─${venv_prompt}${user_host} ${current_dir} ${git_branch}
╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{$color_primary}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{$color_error}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"
ZSH_THEME_VIRTUALENV_PREFIX="%F{$color_venv}("
ZSH_THEME_VIRTUALENV_SUFFIX=")%f "

}
