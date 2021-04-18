# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# make aliases work with sudo
alias sudo='sudo '

# pacman aliases for Arch
alias pac='pacman'
alias paci='pacman -S' # install
alias pacu='pacman -Syu' # update
alias pacr='pacman -Rs' # remove

alias emacs='emacs -nw'

# dotfiles git
alias config='/usr/bin/git --git-dir=/home/rak/.cfg/ --work-tree=/home/rak'

# installations
alias ovito='/home/rak/ovito/bin/ovito'

# development
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/rak/Documents/femocs/dealii/build/lib
alias femocs="/home/rak/Documents/femocs/build/femocs"
alias femocs_debug="/home/rak/Documents/femocs/build/femocs_debug"

