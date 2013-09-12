set nocompatible

filetype on
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Better than grep recursive search
Bundle 'mileszs/ack.vim'
" Comment lines with gcc
Bundle 'tpope/vim-commentary'
" Change text inside surrounding stuff
Bundle 'tpope/vim-surround'
" Add color schemes
Bundle 'dandorman/vim-colors'
Bundle 'L9'
Bundle 'FuzzyFinder'
" Fuzzy search on project
Bundle 'kien/ctrlp.vim'
" Trigger awesome motion with <Leader><Leader>
Bundle 'Lokaltog/vim-easymotion'
" Better matching
Bundle 'tsaleh/vim-matchit'
" Git plugin for vim
Bundle 'tpope/vim-fugitive'
Bundle 'xolox/vim-misc'
" Regenerate tags every time
Bundle 'xolox/vim-easytags'
" Mini explorer for buffers
Bundle 'fholgado/minibufexpl.vim'
" Multiple cursors
Bundle 'terryma/vim-multiple-cursors'
" Check syntax
Bundle 'scrooloose/syntastic'
" Mini window with tags
Bundle 'majutsushi/tagbar'
" Autocomplete on tab
" Bundle 'ervandew/supertab'
" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
" Bundle 'garbas/vim-snipmate'
Bundle 'SirVer/ultisnips'
" Actual snippets
Bundle 'honza/vim-snippets'
Bundle 'Valloric/YouCompleteMe'
" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
" JavaScript
" CoffeeScript
" HTML
" CSS

" Common config {
" Indentind and stuff
set autoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set complete-=i
set smarttab
set shiftround

" Visuals
set laststatus=2 " always show status line
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu

" Editor
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline
set encoding=utf-8 " set default encoding
set listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:+
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:.,extends:>,precedes:<,nbsp:\u00b7"
endif
set list
set autoread

set nobackup " do not keep a backup file, use versions instead
set history=1000 " keep 50 lines of command line history
set incsearch " do incremental searching
syntax on
set t_Co=256
set hlsearch
set hidden " do not close buffer, just hide it
set nowrap " don't wrap lines
set tabstop=2 shiftwidth=2 " a tab is two spaces
set expandtab " a tab is actually spaces, not tabs
set ignorecase " ignore case in search
set smartcase " until search pattern have at least one capital letter
set number " show line numbers
set timeoutlen=500
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
" }

" Visual style {
colorscheme molokai
if has("gui_running")
  colorscheme codeschool
endif
" }

" Autocmd {
filetype plugin indent on
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!
autocmd FileType text setlocal textwidth=78
" Go to the last position in file
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup END
" }

" Custom mappings {
map Q gq
inoremap <C-U> <C-G>u<C-U>
imap <S-CR> <CR><CR>end<Esc>-cc
" Remap leader to ,
let mapleader=","
" Exit INSERT mode on jk
inoremap jj <ESC>
nnoremap <Leader>hs :nohls<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
" }

" Custom functions {
" Difference between buffer and original file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
" }

" Minibuffer settings {
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
map <C-Tab> :bnext<CR>
map <C-S-Tab> :bprevious<CR>
" }

" Tagbar {
nnoremap <Leader>t :TagbarToggle<CR>
" }

" Easytags {
let g:easytags_updatetime_min=2000
" }

" Ultinsips {
" Resolve key mapping issue (Ultisnips clashes with YouCompleteMe)
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }

" Omnicompletion {
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" }

" Multiple cursors {
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }

