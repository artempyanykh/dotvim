set nocompatible

filetype on
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" Vim sees to work faster with this options
set re=1 " old regex engine
set ttyfast
set lazyredraw

exe 'source ' . expand('~/.vim/settings/editor.vim')
" exe 'source ' . expand('~/.vim/settings/frontend.vim')
exe 'source ' . expand('~/.vim/settings/git.vim')
exe 'source ' . expand('~/.vim/settings/mappings.vim')
exe 'source ' . expand('~/.vim/settings/misc.vim')
exe 'source ' . expand('~/.vim/settings/navigation.vim')
exe 'source ' . expand('~/.vim/settings/ruby.vim')
exe 'source ' . expand('~/.vim/settings/visuals.vim')
exe 'source ' . expand('~/.vim/settings/autocomplete.vim')
" exe 'source ' . expand('~/.vim/settings/terminal.vim')
