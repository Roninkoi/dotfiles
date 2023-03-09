# .bash_aliases

# make aliases work with sudo
alias sudo='sudo '

alias ls='ls --color=auto'
alias ll='ls --color=auto -lah'
PS1='[\u@\h \W]\$ '

# pacman aliases for Arch

alias update='pacman -Syu && yay -Syu'

alias pac='pacman'
alias paci='pacman -S' # install
alias pacu='pacman -Syu' # update
alias pacr='pacman -Rs' # remove
alias pacs='pacman -Ss' # search
alias pacsi='pacman -Ssq | sudo pacman --needed -S -' # search & install
alias pacl='pacman -Q | grep' # list

alias yayi='yay -S' # install
alias yayu='yay -Syu' # update
alias yayr='yay -Rs' # remove
alias yays='yay -Ss' # search
alias yayl='yay -Q | grep' # list
alias yayb='yay --getpkgbuild' # download PKGBUILD

alias emacs='emacs -nw'

alias gitld='git diff @~..@' # last commit diff
alias configld='config diff @~..@'

alias search='grep -rnwi . -e'

alias fikeys='localectl set-keymap fi' ## loadkeys fi

alias mpihalf='mpirun -np 16'

alias watchio='dstat -D'

