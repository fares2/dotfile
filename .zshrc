ZSH_THEME="robbyrussell"
alias i='doas pacman -S'
alias u='doas pacman -Syu'
export CLICOLOR=1
export EDITOR='nvim'
export PATH=$PATH:$HOME/go/bin
export PS1=$'%n@%m:\e[0;36m%~\e[0m$ '
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh
