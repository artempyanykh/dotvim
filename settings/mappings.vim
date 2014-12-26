" switch between tabs with cmd+1, cmd+2,..."
nnoremap <D-1> <ESC>1gt
nnoremap <D-2> <ESC>2gt
nnoremap <D-3> <ESC>3gt
nnoremap <D-4> <ESC>4gt
nnoremap <D-5> <ESC>5gt
nnoremap <D-6> <ESC>6gt
nnoremap <D-7> <ESC>7gt
nnoremap <D-8> <ESC>8gt
nnoremap <D-9> <ESC>9gt
inoremap <D-1> <ESC>1gt
inoremap <D-2> <ESC>2gt
inoremap <D-3> <ESC>3gt
inoremap <D-4> <ESC>4gt
inoremap <D-5> <ESC>5gt
inoremap <D-6> <ESC>6gt
inoremap <D-7> <ESC>7gt
inoremap <D-8> <ESC>8gt
inoremap <D-9> <ESC>9gt

map Q gq
inoremap <C-U> <C-G>u<C-U>
imap <S-CR> <CR><CR>end<Esc>-cc

" Remap leader to ,
let mapleader=","
" Exit INSERT mode on jj
inoremap jk <ESC>
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
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tc :tabnew<CR>

" Rails-specific mappings
nnoremap <Leader>iv i<%= %><ESC>hhi @
nnoremap <Leader>av a<%= %><ESC>hhi @
" }


" Window size management {
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>. :exe "vertical resize +20"<CR>
nnoremap <silent> <Leader>m :exe "vertical resize -20"<CR>
nnoremap <silent> <Leader>> :exe "resize +10"<CR>
nnoremap <silent> <Leader>< :exe "resize -10"<CR>
" }

" Gundo {
nnoremap <F5> :GundoToggle<CR>
" }
