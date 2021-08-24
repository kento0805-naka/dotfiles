# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

# プラグイン
plugins=(git)

source $ZSH/oh-my-zsh.sh

# alias
alias dc="docker-compose"
alias dce="docker-compose exec"
alias mgw="ssh master-gw"
alias px='ssh -Nvvv -f -D 10080 master-gw'

