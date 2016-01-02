function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo $ZSH_THEME_VIRTUALENV_PROMPT_PREFIX`basename $VIRTUAL_ENV`$ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX
}


PROMPT=' %{$fg_bold[green]%}➤%{$fg_bold[magenta]%} %c  '

RPROMPT='$(git_prompt_info)$(virtualenv_info)%{$reset_color%}'

ZSH_THEME_VIRTUALENV_PROMPT_PREFIX="%{$fg_bold[black]%} %{$fg_bold[magenta]%}"
ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[yellow]%}☂ %{$reset_color%}"

time="%{$fg[red]%})%*%{$reset_color%}"
