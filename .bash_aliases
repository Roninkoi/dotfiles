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
alias paclm='pacman -Qm | grep' # list AUR

alias yay='yay --aur'
alias yayi='yay --aur -S' # install
alias yayu='yay --aur -Syu' # update
alias yayr='yay --aur -Rs' # remove
alias yays='yay --aur -Ss' # search
alias yayl='yay --aur -Q | grep' # list
alias yayb='yay --aur --getpkgbuild' # download PKGBUILD

alias emacs='emacs -nw'

alias gitld='git diff @~..@' # last commit diff
alias configld='config diff @~..@'

alias search='grep -rnwi . -e'

alias archive='rsync -a --progress'

alias fikeys='localectl set-keymap fi' ## loadkeys fi

alias mpihalf='mpirun -np 16'

alias watchio='dstat -D'
alias netmon='netstat -natp'

##alias switch1='ddcutil -b 6 setvcp 0x60 0x11'
##alias switch3='ddcutil -b 6 setvcp 0x60 0x11'

