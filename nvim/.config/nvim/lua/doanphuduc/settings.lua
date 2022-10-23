local g = vim.g
local o = vim.o
local opt = vim.opt
local cmd = vim.cmd

-- Leader mapping
g.mapleader = " "

-- Mouse scroll
opt.mouse = "a"

-- Termgui colors
o.termguicolors = true

-- Buffer index & name
o.ruler = true

-- Indent
o.tabstop = 2
o.shiftwidth = 2
o.shiftround = true
o.expandtab = true
o.smartindent = true

-- Wrap line when line too long
o.wrap = true

-- Auto write before running command
o.autowrite = true

-- Limit 100 characters in line
o.textwidth = 100

o.joinspaces = false

-- Hybrid number
o.number = true
o.relativenumber = true

-- Highlight current line
o.cursorline = true

o.signcolumn = "yes"

-- More natural split behaviour
o.splitbelow = true
o.splitright = true

-- Favorite gui cursor
-- o.guicursor=n-v-c-sm:block,i:block-blinkwait175-blinkoff150-blinkon175,ci-ve:ver25-Cursor,r-cr-o:hor20
local ok, _ = pcall(cmd, 'set guicursor=n-v-c-sm:block,i:block-blinkwait175-blinkoff150-blinkon175,ci-ve:ver25-Cursor,r-cr-o:hor20')

-- Sync clipboard between OS and nvim
o.clipboard = 'unnamedplus'

-- Searching
o.incsearch = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Remember 50 items in command line history
o.history = 50

-- Fix bug: Undefined variables
g.NERDTreeGitStatusWithFlags = true

-- Set colorscheme
local ok, _ = pcall(cmd, 'colorscheme dracula')

-- Allow misspelling
cmd.cnoreabbrev({'Q', 'q'})
cmd.cnoreabbrev({'W', 'w'})
