" Common config {
" Indentind and stuff
set autoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set complete-=i
set smarttab
set shiftround

" Editor
if !&scrolloff
  set scrolloff=5
endif
if !&sidescrolloff
  set sidescrolloff=10
endif
set display+=lastline
set encoding=utf-8 " set default encoding

set listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:+
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:.,extends:>,precedes:<,nbsp:\u00b7"
endif
set list
set autoread

set history=1000 " keep 50 lines of command line history
set incsearch " do incremental searching
syntax on
set t_Co=256
set hlsearch
set hidden " do not close buffer, just hide it
set nowrap " don't wrap lines
set tabstop=2 shiftwidth=2 " a tab is two spaces
set foldnestmax=4
set foldlevelstart=4 " no folding by default
set expandtab " a tab is actually spaces, not tabs
set ignorecase " ignore case in search
set smartcase " until search pattern have at least one capital letter
set number " show line numbers
set timeoutlen=500
set splitright " split vertical windows right to the current windows
set splitbelow " split horizontal windows below to the current windows


" Autocmds
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

" Custom functions {
" Difference between buffer and original file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
" }

