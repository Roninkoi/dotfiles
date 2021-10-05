# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/root/.local/bin
export EDITOR='emacs -nw'

# dotfiles git
# git clone --bare https://github.com/Roninkoi/dotfiles
# git --git-dir=/home/rak/dotfiles.git/ --work-tree=/home/rak checkout rak .
alias config='/usr/bin/git --git-dir=/home/rak/dotfiles.git/ --work-tree=/home/rak'

# development
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/rak/Documents/femocs/dealii/build/lib
alias femocs="/home/rak/Documents/femocs/build/femocs"
alias femocs_debug="/home/rak/Documents/femocs/build/femocs_debug"


