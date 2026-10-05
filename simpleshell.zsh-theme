# based on af-magic.zsh-theme by https://github.com/andyfleming/

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="10"; fi

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

DOMAIN="$(hostname -f | awk '{split($0,a,"."); print a[2] }')"

if [ "$DOMAIN" = "dc" ] || [ "$DOMAIN" = "home" ]; then
  PROMPT='%F{$NCOLOR}%n%f@%M.$DOMAIN %F{15}$(get_pwd)%f %(?.$(git_prompt_info).): '
else
  PROMPT='%F{$NCOLOR}%n%f@$(hostname -f) %F{15}$(get_pwd)%f %(?.$(git_prompt_info).): '
fi

RPROMPT='%F{160}%B%(?..%?)%b%f%{$reset_color%}'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[21]($FG[15]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[21])%{$reset_color%}"

# 1. Standard dircolors laden, falls LS_COLORS noch leer ist
if [[ -z "$LS_COLORS" ]] && command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
fi

# 2. Alle bestehenden ow= und tw= Einträge inklusive Farbcodes herauslöschen
LS_COLORS="${LS_COLORS//ow=<->*(;[0-9]#)*/}"
LS_COLORS="${LS_COLORS//tw=<->*(;[0-9]#)*/}"

# 3. Doppelpunkte aufräumen und eigene Werte anhängen
LS_COLORS="${LS_COLORS//::/:}"
export LS_COLORS="${LS_COLORS#:}:ow=01;34:tw=01;34:"

# 4. Zsh Completion anweisen, die neuen Farben zu nutzen
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
