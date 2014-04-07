" Autocomplete features
Bundle 'Shougo/neocomplete.vim'

" NeoComplete {
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#max_list=10
let g:neocomplete#auto_completion_start_length=3
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
" This makes sure we use neocomplete completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out
" So SKWP says, stolen from him
let g:neocomplete#force_overwrite_completefunc=1

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'

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
  let g:neocomplete#sources#omni#input_patterns={}
endif
let g:neocomplete#sources#omni#input_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl='\h\w*->\h\w*\|\h\w*::'
" }
