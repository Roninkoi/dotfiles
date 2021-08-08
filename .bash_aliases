# .bash_aliases

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
