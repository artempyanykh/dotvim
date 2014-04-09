" Fuzzy search on project
Bundle 'kien/ctrlp.vim'
" Project tree
Bundle 'scrooloose/nerdtree.git'
Bundle 'jistr/vim-nerdtree-tabs'
" Buffers
Bundle 'jeetsukumaran/vim-buffergator'
" Better than grep recursive search
Bundle 'rking/ag.vim'

" Buffergator {
let g:buffergator_suppress_keymaps=1
nnoremap<silent> <Leader>b :BuffergatorToggle<CR>
" }
" NERDTree + Tabs {
nnoremap<silent> <Leader>tt :NERDTreeTabsToggle<CR>
" NERDTree UI "
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeWinSize=30
"" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup=0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_startup_cd=1
let NERDTreeIgnore = ['\.pyc$']
" }

" CtrlP {
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif
" }

" Some Ag happiness {
nnoremap <Leader>f :Ag<Space>
" }
