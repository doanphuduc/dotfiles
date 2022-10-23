-- Prevent continue commenting
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
})

-- Custom filetype
vim.api.nvim_create_autocmd('BufRead,BufNewFile', {
  pattern = '*.pconf',
  command = 'set filetype=pconf'
})
