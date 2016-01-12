# ┏━╸╻╺┳╸
# ┃╺┓┃ ┃ 
# ┗━┛╹ ╹

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gcmsg='git commit -m'
alias gpoat='git push origin --all && git push origin --tags'
alias gcm='git checkout master'
alias gco='git checkout'
alias gst='git status'
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


# ╺┳┓┏━╸┏┓ ╻┏━┓┏┓╻
#  ┃┃┣╸ ┣┻┓┃┣━┫┃┗┫
# ╺┻┛┗━╸┗━┛╹╹ ╹╹ ╹

alias age='apt-get'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'


# ┏━┓╺┳╸╻ ╻┏━╸┏━╸                                                                 
# ┗━┓ ┃ ┃ ┃┣╸ ┣╸ 
# ┗━┛ ╹ ┗━┛╹  ╹ 

setopt auto_cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias md="mkdir -p"

alias del="rm -r"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias ll="ls -lahF --color=auto"
alias ls="ls --color=auto"
alias lsl="ls -lhF --color=auto"

function hs
{
    history | grep $*
}
alias hsi='hs -i'
