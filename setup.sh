DOTFILESDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Applying VIM settings"
cd $DOTFILESDIR

echo "Acquiring Vundle"
git submodule init
git submodule update

[[ -d $HOME/.vim ]] && mv -f $HOME/.vim $HOME/.vim.old
ln -sf "$DOTFILESDIR" $HOME/.vim
ln -sb "$DOTFILESDIR/.vimrc" $HOME/.vimrc

echo "Installing VIM plugins"
vim +BundleInstall +qall
