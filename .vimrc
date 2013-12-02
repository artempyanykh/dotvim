set nocompatible

filetype on
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Better than grep recursive search
Bundle 'epmatsw/ag.vim'
" Comment lines with gcc
Bundle 'tpope/vim-commentary'
" Change text inside surrounding stuff
Bundle 'tpope/vim-surround'
" Add color schemes
Bundle 'flazz/vim-colorschemes'
Bundle 'L9'
" Fuzzy search on project
Bundle 'kien/ctrlp.vim'
" Trigger awesome motion with <Leader><Leader>
Bundle 'Lokaltog/vim-easymotion'
" Better matching
Bundle 'tsaleh/vim-matchit'
" Regenerate tags every time
" Bundle 'xolox/vim-easytags'
" Buffers
Bundle 'jeetsukumaran/vim-buffergator'
" Bundle 'vim-scripts/ZoomWin'
" Multiple cursors
Bundle 'terryma/vim-multiple-cursors'
" Check syntax
Bundle 'scrooloose/syntastic'
" " Mini window with tags
" Bundle 'majutsushi/tagbar'
" Project tree
Bundle 'scrooloose/nerdtree.git'
Bundle 'jistr/vim-nerdtree-tabs'
" Better search
Bundle 'henrik/vim-indexed-search'
" Fancy undo
Bundle 'sjl/gundo.vim'
" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
" Bundle 'garbas/vim-snipmate'
" Bundle 'SirVer/ultisnips'
" " Actual snippets
" Bundle 'honza/vim-snippets'
" Autocomplete features
" Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/neocomplete.vim'
" Auto-complete paired characters (, {, etc.
Bundle 'Raimondi/delimitMate'
" Better session management
Bundle 'xolox/vim-session'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'

" JavaScript
Bundle 'pangloss/vim-javascript'
" CoffeeScript
Bundle 'kchmck/vim-coffee-script'
" HTML
" CSS

" Git plugins for vim
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'xolox/vim-misc'

" Common config {
" Indentind and stuff
set autoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set complete-=i
set smarttab
set shiftround

" Visuals
set laststatus=2 " always show status line
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=\ on\ %{fugitive#statusline()}     " current branch
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set wildmenu

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

set nobackup " do not keep a backup file, use versions instead
set history=1000 " keep 50 lines of command line history
set incsearch " do incremental searching
syntax on
set t_Co=256
set hlsearch
set hidden " do not close buffer, just hide it
set nowrap " don't wrap lines
set tabstop=2 shiftwidth=2 " a tab is two spaces
set foldlevelstart=20 " no folding by default
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
colorscheme Monokai
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

" autocmd FileType ruby,eruby setlocal foldmethod=indent
" autocmd FileType ruby,eruby normal zR
" }

" Custom mappings {
map Q gq
inoremap <C-U> <C-G>u<C-U>
imap <S-CR> <CR><CR>end<Esc>-cc
" Remap leader to ,
let mapleader=","
" Exit INSERT mode on jj
inoremap jj <ESC>
nnoremap<silent> <Leader>h :nohls<CR>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" should use ; to enter command mode because of the mapping right above
map <leader>e ;edit %%
map <leader>v ;view %%
" }

" Custom functions {
" Difference between buffer and original file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
" }

" Tagbar {
" 's' from 'structure'
" nnoremap<silent> <Leader>s :TagbarToggle<CR>
" }

" Easytags {
" let g:easytags_updatetime_min=2000
" }

" Ultinsips {
" Resolve key mapping issue (Ultisnips clashes with YouCompleteMe)
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
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

" Buffergator {
let g:buffergator_suppress_keymaps=1
nnoremap<silent> <Leader>b :BuffergatorToggle<CR>
" }

" NERDTree + Tabs {
nnoremap<silent> <Leader>t :NERDTreeTabsToggle<CR>
" NERDTree UI "
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
"" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_startup_cd = 1
" }

" Window size management {
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>. :exe "vertical resize +20"<CR>
nnoremap <silent> <Leader>, :exe "vertical resize -20"<CR>
nnoremap <silent> <Leader>> :exe "resize +10"<CR>
nnoremap <silent> <Leader>< :exe "resize -10"<CR>
" }

" Vim Fugitive {
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc <C-w>o:diffoff<CR>
" }

" Gundo {
nnoremap <F5> :GundoToggle<CR>
" }

" CtrlP {
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif
" }

" Some Ag happiness {
nnoremap <Leader>f :Ag<Space>
" }

" Vim-Session {
let g:session_autoload='no'
let g:session_autosave='no'
nnoremap <Leader>ss :SaveSession<CR>
nnoremap <Leader>so :OpenSession<CR>
" }

" NeoComplete {
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#max_list = 10
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" This makes sure we use neocomplete completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out
" So SKWP says, stolen from him
let g:neocomplete#force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" Complete largest common substring
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }
