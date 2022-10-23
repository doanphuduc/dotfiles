local g = vim.g
local opt_local = vim.opt_local

g.python_highlight_space_errors = 0
opt_local.wrap = false
opt_local.autoindent = true
opt_local.expandtab = true
opt_local.shiftwidth = 4
opt_local.tabstop = 4

-- Comment chars
opt_local.commentstring = "# %s"
