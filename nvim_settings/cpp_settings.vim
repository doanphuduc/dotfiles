function! CPPSET()
  set cindent
  set nowrap
  set expandtab
  setlocal cinkeys-=:
  setlocal cino=g1,h1,j1,(0,ws,Ws

  " setlocal equalprg=clang-format\ -style=google
endfunction

autocmd FileType h          call CPPSET()
autocmd FileType cc         call CPPSET()
autocmd FileType cpp        call CPPSET()
