# ╺┳┓┏━╸┏┓ ╻┏━┓┏┓╻
#  ┃┃┣╸ ┣┻┓┃┣━┫┃┗┫
# ╺┻┛┗━╸┗━┛╹╹ ╹╹ ╹
alias _="sudo"
alias pls='sudo $(fc -ln -1)'
alias age='apt-get'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'


# ┏━╸╻╺┳╸
# ┃╺┓┃ ┃ 
# ┗━┛╹ ╹
alias g='git'
alias gf='git fetch'
alias ga='git add'
alias gaa='git add --all'
alias gcmsg='git commit -m'
alias gpoat='git push origin --all && git push origin --tags'
alias gcm='git checkout master'
alias gco='git checkout'
alias gst='git status'
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


# ┏━┓┏━┓
# ┣━┛┗━┓
# ╹  ┗━┛
alias psa="ps aux"
alias psg="ps aux | grep"


# ┏━╸╺┳┓
# ┃   ┃┃
# ┗━╸╺┻┛
setopt auto_cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."


# ╻  ┏━┓
# ┃  ┗━┓
# ┗━╸┗━┛
alias ll="ls -lahF --color=auto"
alias ls="ls --color=auto"
alias lsl="ls -lhF --color=auto"
alias lsg="ll | grep"


# ┏┓╻╻ ╻╻┏┳┓
# ┃┗┫┃┏┛┃┃┃┃
# ╹ ╹┗┛ ╹╹ ╹
alias v="nvim"
alias vi="nvim"
alias vim="nvim"


# ┏┳┓┏━┓┏━╸╻ ╻
# ┃┃┃┣━┫┣╸ ┣━┫
# ╹ ╹╹ ╹┗━╸╹ ╹
alias pc='pass -c'
alias todo='grep "FIXME" * ; grep "TODO" * ; grep "XXX" *'
alias md="mkdir -p"
alias rmrf="rm -rf"
function hs
{
    history | grep $*
}
alias hsi='hs -i'
alias calc='noglob perl -e '\''shift; $x = eval qq(@ARGV); print $x; printf " 0x%x 0%o %b\n", $x, $x, $x'\'' _' ' "'


#┏━╸┏━┓╻┏ ╻ ╻┏━┓
#┣╸ ┃ ┃┣┻┓┃ ┃┗━┓
#╹  ┗━┛╹ ╹┗━┛┗━┛
function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}
function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}
alias fokus='countdown 2700 && notify-send -u critical -t 0 LASERFOKUS!'
