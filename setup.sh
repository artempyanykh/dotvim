DOTFILESDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Applying VIM settings"
cd $DOTFILESDIR
[[ -d $HOME/.vim ]] && mv -f $HOME/.vim $HOME/.vim.old
ln -sf "$DOTFILESDIR" "$HOME/.vim"
ln -sb "$DOTFILESDIR/.vimrc" "$HOME/.vimrc"

echo "Acquiring Vundle"
git submodule init
git submodule update

echo "Installing VIM plugins"
vim +BundleInstall +qall

echo "Initializing YouCompleteMe"
cd ~/.vim/bundle/YouCompleteMe
./install.sh
