#!/bin/bash

DOTFILESDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Applying VIM settings"
cd $DOTFILESDIR
[[ -d $HOME/.vim ]] && mv -f $HOME/.vim $HOME/.vim.old
ln -nsfv "$DOTFILESDIR" "$HOME/.vim"
ln -nsfv "$DOTFILESDIR/vimrc" "$HOME/.vimrc"
if [[ "$(uname)" =~ Darwin ]]; then
  ln -nsfv "$DOTFILESDIR/macvimrc" "$HOME/.gvimrc"
else
  ln -nsfv "$DOTFILESDIR/gvimrc" "$HOME/.gvimrc"
fi

echo "Acquiring Vundle"
git submodule init
git submodule update

echo "Installing VIM plugins"
vim +BundleInstall +qall

if [ -d $HOME/.vim/bundle/YouCompleteMe ]; then
  echo "Initializing YouCompleteMe"
  cd ~/.vim/bundle/YouCompleteMe
  ./install.sh
fi
