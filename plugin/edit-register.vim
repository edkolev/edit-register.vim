
function! SaveRegister()
  echo "save"
  let line = line('.') | let col = col('.') |
  execute 'normal gg"' . b:register . 'yG'
  call cursor(line, col)
  let &modified = 0

  let @a=substitute(@a, "\n", "", 'g')

  execute 'reg ' . b:register
endfunction

function! EditRegister(register) abort
  new
  execute 'file register://' . a:register

  nnoremap <buffer> q :q<cr>
  set buftype=acwrite
  setlocal bufhidden=delete
  setlocal noswapfile

  execute 'normal "' . a:register . 'p'

  let b:register = a:register

  autocmd BufWriteCmd <buffer> call SaveRegister()
endfunction
