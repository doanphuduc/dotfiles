local cmd = vim.cmd
local nnoremap = require('doanphuduc.keymap').nnoremap

-- fzf config -- tricky way to run vim scripts in lua :s
local ok, _ = pcall(
    cmd, 
[[
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = {'up': '~90%', 'window': {'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5}}

let $FZF_DEFAULT_OPTS = "--layout=reverse --info=inline
\ --bind ctrl-y:preview-up,ctrl-e:preview-down,
\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"

" Ignore dot files when searching
command! -bang -nargs=? -complete=dir Files 
      \call fzf#run(fzf#wrap('files', fzf#vim#with_preview({'dir': <q-args>, 'sink': 'e', 'source': "rg --files --hidden -g '!.*'" }), <bang>0))

" Search all files
command! -bang -nargs=? -complete=dir AllFiles 
      \call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({'dir': <q-args>, 'sink': 'e', 'source': "rg --files --hidden --no-ignore" }), <bang>0))
]]
)

nnoremap('<Leader>f', ':Files<CR>')
nnoremap('<Leader>F', ':AllFiles<CR>')
nnoremap('<Leader>g', ':Rg<CR>')
