export ZSH=/home/fnn/.oh-my-zsh

ZSH_THEME="fnnpth"

plugins=(git docker ubuntu node npm gulp history)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh

# alias
alias cpu3='echo "30" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu4='echo "40" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu5='echo "50" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu6='echo "60" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu7='echo "70" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu8='echo "80" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu9='echo "90" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu0='echo "100" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias vi='nvim'
alias vim='nvim'

# Virtualenv
export WORKON_HOME=~/Development/Python/

# Default editor
EDITOR=nvim
VISUAL=$EDITOR
export EDITOR VISUAL
