#!/bin/bash -eu

function command_exists() {
    type "$1" &> /dev/null ;
}

: "install brew" && {
    if ! command_exists brew; then
        echo "installing brew ...."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "brew is already installed"
    fi
}

: "install packages by brew" && {
    PACKAGES=( jq pstree git ansible openssl awscli tree ecspresso )
    for package in ${PACKAGES[@]}; do
        if ! brew list | grep $package &> /dev/null; then
            echo "installing ${package}"
            brew install $package
        else
            echo "${package} is already installed"
        fi
    done
}

: "set up framework" && {
    FRAMEWORK="oh-my-zsh"
    if ! [ "${ZSH}" = "${HOME}/.${FRAMEWORK}" ]; then
      ./ohmyzsh/tools/install.sh | ZSH=~/dotfiles/oh-my-zsh sh
    else
      echo "${FRAMEWORK} is already installed"
    fi
 }
