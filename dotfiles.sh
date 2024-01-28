#!/bin/sh
# Set up dotfiles in home directory
# Usage: ./dotfiles.sh <installdir>

installdir=/home/rak

if [ $# = 1 ]; then
    installdir=$1
fi

cd $installdir
rm -rf dotfiles.git
rm -rf .emacs.d
rm -f .bashrc
git clone --bare https://github.com/Roninkoi/dotfiles
git --git-dir=${installdir}/dotfiles.git/ --work-tree=${installdir} checkout rak .
git --git-dir=${installdir}/dotfiles.git/ --work-tree=${installdir} submodule update --init

