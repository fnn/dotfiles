for config (~/.config/zsh/*.zsh) source $config

# alias
alias cpu3='echo "30" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu4='echo "40" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu5='echo "50" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu6='echo "60" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu7='echo "70" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu8='echo "80" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu9='echo "90" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'
alias cpu0='echo "100" | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct'

export EDITOR=nvim
