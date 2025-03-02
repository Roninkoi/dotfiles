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
export EDITOR='emacs'

# dotfiles git
# git clone --bare https://github.com/Roninkoi/dotfiles
# git --git-dir=/home/rak/dotfiles.git/ --work-tree=/home/rak checkout rak .
alias config="/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME"

# development paths
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/femocs/dealii/lib:$HOME/femocs/lib:$HOME/lammps/build ##:$HOME/gcc/lib64
export PYTHONPATH=$PYTHONPATH:$HOME/femocs/lib:$HOME/lammps/python
export DEAL_II_DIR=$HOME/femocs/dealii

# custom environment variables
export MOZ_ENABLE_WAYLAND=1

export PROTON_HIDE_NVIDIA_GPU=0
export PROTON_ENABLE_NVAPI=1
export VKD3D_CONFIG=dxr,dxr11
export PROTON_ENABLE_NGX_UPDATER=1

