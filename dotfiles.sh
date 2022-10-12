#!/bin/sh
# Set up dotfiles in home directory
# Usage: ./dotfiles.sh <username>
username=rak

if [ $# = 1 ]; then
    username=$1
fi

installdir=/home/${username}

cd $installdir
rm -rf dotfiles.git
rm -rf .emacs.d
rm -f .bashrc
git clone --bare https://github.com/Roninkoi/dotfiles
git --git-dir=${installdir}/dotfiles.git/ --work-tree=${installdir} checkout rak .
git --git-dir=${installdir}/dotfiles.git/ --work-tree=${installdir} submodule update --init
configalias="/usr/bin/git --git-dir=${installdir}/dotfiles.git/ --work-tree=${installdir}"
echo "config: ${configalias}"
sed -i "s@alias config.*@alias config=\"${configalias}\"@g" .bashrc
sed -i "s@username=.*@username=${username}@g" .bashrc

