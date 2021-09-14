" Airline 
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Tmux with similar Airline status bar

let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
" Clean Airline status bar
let g:airline_section_z = '%3p%% %3l/%L %3v'
let g:airline#extensions#whitespace#enabled = 0
