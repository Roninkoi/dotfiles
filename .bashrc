# .bashrc

username=rak

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
alias config="/usr/bin/git --git-dir=/home/${username}/dotfiles.git/ --work-tree=/home/${username}"

# development
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/${username}/Documents/femocs/dealii/lib:/home/${username}/Documents/femocs/lib
export DEAL_II_DIR=/home/${username}/Documents/femocs/dealii
alias femocs="/home/${username}/Documents/femocs/build/femocs"
alias femocs_debug="/home/${username}/Documents/femocs/build/femocs_debug"

