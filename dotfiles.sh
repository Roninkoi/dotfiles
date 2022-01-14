#!/bin/sh
# Set up dotfiles in directory
# Usage: ./dotfiles.sh <home directory>
installdir=/home/rak

if [ $# == 1 ]; then
    installdir=$1
fi

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

