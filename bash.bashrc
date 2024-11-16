PS1='\[\e[0;31m\]┌─[\[\e[0;32m\]\u\[\e[0;31m\]@\[\e[0;31m\]termux\[\e[0;31m\]]─[\[\e[0;37m\]\w\[\e[0;31m\]]\n\[\e[0;31m\]└╼\[\e[0;37m\]$ \[\e[0m\]'

RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
MAGENTA='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'
RESET='\e[0m'

function sysinfo() {
    local cpu_temp=""
    if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
        cpu_temp=$(awk '{printf "%.1f°C", $1/1000}' /sys/class/thermal/thermal_zone0/temp)
    fi
    
    local mem_info=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
    local storage_info=$(df -h /storage/emulated | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')
    local android_version=$(getprop ro.build.version.release)
    local device_model=$(getprop ro.product.model)
    
    echo -e "${RED}┌──────────── System ────────────┐${RESET}"
    echo -e "${RED}│${RESET} • Device: $device_model"
    echo -e "${RED}│${RESET} • Android: $android_version"
    echo -e "${RED}│${RESET} • Memory: $mem_info"
    echo -e "${RED}│${RESET} • Storage: $storage_info"
    [ ! -z "$cpu_temp" ] && echo -e "${RED}│${RESET} • CPU Temp: $cpu_temp"
    echo -e "${RED}└────────────────────────────────┘${RESET}"
}

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias back='cd -'
alias home='cd ~'

# List operations
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lha --color=auto'
alias l='ls -CF --color=auto'
alias l.='ls -d .* --color=auto'
alias dir='ls --color=auto --format=vertical'
alias lt='ls -ltrh --color=auto'        # sort by date
alias lsize='ls -lSrh --color=auto'     # sort by size
alias ltype='ls -lXh --color=auto'      # sort by extension

# File operations
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias rr='rm -r'
alias del='rm -i'

# System
alias c='clear'
alias cls='clear'
alias reload='source ~/.bashrc'
alias path='echo -e ${PATH//:/\\n}'
alias py='python'
alias py3='python3'

# File searching
alias ff='find . -type f -name'
alias fd='find . -type d -name'
alias fgrep='find . -type f -exec grep -l'
alias h='history'
alias hg='history | grep'

# Process management
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psm='ps aux | awk '"'"'{if($4>0.0)print $0}'"'"''
alias pst='pstree'
alias k9='kill -9'

# Text editing
alias n='nano'
alias nf='nano $(fzf)'

# Network (if netstat is installed)
alias ports='netstat -tulanp'
alias connections='netstat -naptu'
alias opens='lsof -i'

# System monitoring
alias mem='free -h'
alias cpu='top -o %CPU'
alias topm='top -o %MEM'

# Directory size
alias ducks='du -cksh * | sort -hr'
alias df='df -h'
alias du='du -h'

# Quick edit
alias ebrc='nano ~/.bashrc'
alias root='cd /'
alias tmp='cd /tmp'

# Shortcut functions
mk() { mkdir -p "$1" && cd "$1"; }
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

clear
sysinfo
echo ""

# ==== Command History Settings ====
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T "

# ==== Tab Completion Settings ====
if [ -f /data/data/com.termux/files/usr/share/bash-completion/bash_completion ]; then
    . /data/data/com.termux/files/usr/share/bash-completion/bash_completion
fi

unset RED GREEN YELLOW BLUE MAGENTA CYAN WHITE RESET