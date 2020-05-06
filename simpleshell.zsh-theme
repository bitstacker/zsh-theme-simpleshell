# based on af-magic.zsh-theme by https://github.com/andyfleming/

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="10"; fi

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

# primary prompt
PROMPT='%F{$NCOLOR}%n%f@%m2 %F{15}$(get_pwd)%f %(?.$(git_prompt_info).): '
RPROMPT='%F{160}%B%(?..%?)%b%f%{$reset_color%}'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[21]($FG[15]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[21])%{$reset_color%}"
