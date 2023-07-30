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
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/${username}/femocs/dealii/lib:/home/${username}/femocs/lib
export DEAL_II_DIR=/home/${username}/femocs/dealii
alias femocs="/home/${username}/femocs/build/femocs"
alias femocs_debug="/home/${username}/femocs/build/femocs_debug"
alias femocs_plot="/home/${username}/Code/FEMOCS-plotters/plot_femocs.sh"

export MOZ_ENABLE_WAYLAND=1

export PROTON_HIDE_NVIDIA_GPU=0
export PROTON_ENABLE_NVAPI=1
export VKD3D_CONFIG=dxr,dxr11
export PROTON_ENABLE_NGX_UPDATER=1

