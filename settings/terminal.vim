" Terminal in vim
Bundle 'trammell/vim-conque'

" Don't highligh special symbols in terminal
autocmd FileType conque_term setlocal nolist

let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_Color = 1
let g:ConqueTerm_ReadUnfocused = 1 " update conqueterm buffer while we're not looking (for running tests)
let g:ConqueTerm_TERM = 'xterm'

nnoremap <silent> <Leader>qc :ConqueTermSplit bundle exec rails c<CR>
nnoremap <silent> <Leader>qp :ConqueTermSplit pry<CR>
nnoremap <silent> <Leader>qb :ConqueTermSplit bash<CR>
nnoremap <silent> <Leader>qvc :ConqueTermVSplit bundle exec rails c<CR>
nnoremap <silent> <Leader>qvp :ConqueTermVSplit pry<CR>
nnoremap <silent> <Leader>qvb :ConqueTermVSplit bash<CR>
nnoremap <silent> <Leader>qic :ConqueTerm bundle exec rails c<CR>
nnoremap <silent> <Leader>qip :ConqueTerm pry<CR>
nnoremap <silent> <Leader>qib :ConqueTerm bash<CR>

function! RspecWithConqueCommand(splitType, runLine, useSpring)
  let executable="rspec"
  if a:useSpring
    let executable="spring " . executable
  endif
  if a:runLine
    let executable=executable . " -l" . line('.')
  endif

  if a:splitType == 'no'
    let conque='ConqueTerm'
  elseif a:splitType == 's'
    let conque='ConqueTermSplit'
  elseif a:splitType == 'v'
    let conque='ConqueTermVSplit'
  endif

  let filename = expand('%:p')

  return conque . " " . executable . " " . filename
endfunction

" Without spring
nnoremap <Leader>rc :ConqueTermSplit rspec spec/
nnoremap <Leader>rvc :ConqueTermVSplit rspec spec/
nnoremap <Leader>ric :ConqueTerm rspec spec/
nnoremap <Leader>rf :execute RspecWithConqueCommand('s', 0, 0)<CR>
nnoremap <Leader>rvf :execute RspecWithConqueCommand('v', 0, 0)<CR>
nnoremap <Leader>rif :execute RspecWithConqueCommand('no', 0, 0)<CR>
nnoremap <Leader>rl :execute RspecWithConqueCommand('s', 1, 0)<CR>
nnoremap <Leader>rvl :execute RspecWithConqueCommand('v', 1, 0)<CR>
nnoremap <Leader>ril :execute RspecWithConqueCommand('no', 1, 0)<CR>

" With spring
nnoremap <Leader>sc :ConqueTermSplit spring rspec spec/
nnoremap <Leader>svc :ConqueTermVSplit spring rspec spec/
nnoremap <Leader>sic :ConqueTerm spring rspec spec/
nnoremap <Leader>sf :execute RspecWithConqueCommand('s', 0, 1)<CR>
nnoremap <Leader>svf :execute RspecWithConqueCommand('v', 0, 1)<CR>
nnoremap <Leader>sif :execute RspecWithConqueCommand('no', 0, 1)<CR>
nnoremap <Leader>sl :execute RspecWithConqueCommand('s', 1, 1)<CR>
nnoremap <Leader>svl :execute RspecWithConqueCommand('v', 1, 1)<CR>
nnoremap <Leader>sil :execute RspecWithConqueCommand('no', 1, 1)<CR>
