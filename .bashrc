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
alias config="/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME"

# development
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/femocs/dealii/lib:$HOME/femocs/lib:$HOME/gcc/lib64
export DEAL_II_DIR=$HOME/femocs/dealii
alias femocs="$HOME/femocs/build/femocs"
alias femocs_debug="$HOME/femocs/build/femocs_debug"
alias femocs_plot="$HOME/Code/FEMOCS-plotters/plot_femocs.sh"

export MOZ_ENABLE_WAYLAND=1

export PROTON_HIDE_NVIDIA_GPU=0
export PROTON_ENABLE_NVAPI=1
export VKD3D_CONFIG=dxr,dxr11
export PROTON_ENABLE_NGX_UPDATER=1

