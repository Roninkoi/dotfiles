# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# development
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/rak/Documents/femocs/dealii/build/lib
alias femocs="/home/rak/Documents/femocs/build/femocs"
alias femocs_debug="/home/rak/Documents/femocs/build/femocs_debug"


