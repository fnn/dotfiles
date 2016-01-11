# ┏━╸╻╺┳╸
# ┃╺┓┃ ┃ 
# ┗━┛╹ ╹

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gcmsg='git commit -m'
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
