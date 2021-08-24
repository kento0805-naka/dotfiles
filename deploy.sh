#!/bin/bash -eu

DOT_FILES=(.zshrc .gitconfig .vimrc .zshenv)

for file in ${DOT_FILES[@]}; do
  dest=${HOME}/${file}
  if [ -e ${dest} ]; then
    echo "[warn] ${dest}: skipped (already exists)"
  else
    ln -s $HOME/dotfiles/$file $dest
    echo "[ ok ] ${dest}: created"
  fi
done
