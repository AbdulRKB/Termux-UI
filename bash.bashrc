command_not_found_handle() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}

PS1='\[\033[38;5;46m\][\[$(tput sgr0)\]\[\033[38;5;172m\]\W\[$(tput sgr0)\]\[\033[38;5;46m\]]\[$(tput sgr0)\]\[\033[38;5;160m\]──►$(tput sgr0)\]\033[38;5;255m\]'
clear
