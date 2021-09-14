let g:python_highlight_space_errors = 0
function! PYSET()
  set nowrap
  set autoindent
  set expandtab
  set shiftwidth=4
  set tabstop=4
endfunction

autocmd BufNewFile,BufReadPost *.py2 set filetype=python
autocmd FileType python     call PYSET()
