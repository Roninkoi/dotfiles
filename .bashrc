# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias emacs='emacs -nw'
alias config='/usr/bin/git --git-dir=/home/rak/.cfg/ --work-tree=/home/rak'
alias ovito='/home/rak/ovito/bin/ovito'

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/rak/Documents/femocs/dealii/build/lib
alias femocs="/home/rak/Documents/femocs/build/femocs"
alias femocs_debug="/home/rak/Documents/femocs/build/femocs_debug"

export GOROOT=/usr/lib/go
export GOPATH=$HOME/go1.12.16
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
#export GOPHERJS_GOROOT="$(go1.12.16 env GOROOT)"

