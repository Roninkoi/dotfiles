# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# make aliases work with sudo
alias sudo='sudo '

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# pacman aliases for Arch

alias update='pacman -Syu && yay -Syu'

alias pac='pacman'
alias paci='pacman -S' # install
alias pacu='pacman -Syu' # update
alias pacr='pacman -Rs' # remove
alias pacs='pacman -Ss' # search
alias pacl='pacman -Q | grep $1' # list

alias yayi='yay -S' # install
alias yayu='yay -Syu' # update
alias yayr='yay -Rs' # remove
alias yays='yay -Ss' # search
alias yayl='yay -Q | grep $1' # list

alias emacs='emacs -nw'

# dotfiles git
alias config='/usr/bin/git --git-dir=/home/rak/.cfg/ --work-tree=/home/rak'

# development
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/rak/Documents/femocs/dealii/build/lib
alias femocs="/home/rak/Documents/femocs/build/femocs"
alias femocs_debug="/home/rak/Documents/femocs/build/femocs_debug"


