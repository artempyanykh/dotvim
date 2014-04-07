" Add color schemes
Bundle 'flazz/vim-colorschemes'
" Better status line
Bundle 'bling/vim-airline'

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
set cc=80,120

colorscheme Monokai

" Some Visuals tweeking {
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
" Disable the macvim toolbar
set guioptions-=T
" }

" Vim AirLine {
let g:airline_theme='bubblegumlight'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" }
