local cmd = vim.cmd

-- airline config -- tricky way to run vim scripts in lua :s
local ok, _ = pcall(
    cmd, 
[[
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

let g:airline_section_z = '%3p%% %3l/%L %3v'
let g:airline#extensions#whitespace#enabled = 0
]]
)
