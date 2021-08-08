# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source global definitions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# dotfiles git
alias config='/usr/bin/git --git-dir=/home/rak/dotfiles.git/ --work-tree=/home/rak'

# development
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/rak/Documents/femocs/dealii/build/lib
alias femocs="/home/rak/Documents/femocs/build/femocs"
alias femocs_debug="/home/rak/Documents/femocs/build/femocs_debug"


