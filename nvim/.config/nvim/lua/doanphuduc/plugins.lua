-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.cmd([[
  augroup PACKER
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])


return require('packer').startup(function()
  -- Package manager
  use("wbthomason/packer.nvim")

  -- Colorschemes
  use("dracula/vim")

  -- Fast delete, update in surround tag, bracket, parenthenses, ...
  use("tpope/vim-surround")

  -- NERDTree plugins

  use("nvim-tree/nvim-web-devicons")
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('doanphuduc.plugins.nvim-tree')
    end
  })

  -- use({
  --     "preservim/nerdtree",
  --     config = function()
  --       require('doanphuduc.plugins.nerdtree.lua')
  --     end
  -- })
  -- use("tsony-tsonev/nerdtree-git-plugin")
  -- use("tiagofumo/vim-nerdtree-syntax-highlight")

  -- Beautiful filetype icons
  -- use("ryanoasis/vim-devicons")

  -- Show git diff in sign column
  use({
    "airblade/vim-gitgutter",
    config = function()
      require('doanphuduc.plugins.vim-gitgutter')
    end
  })

  -- Buffer killer
  use("qpkorr/vim-bufkill")

  -- Comment
  use("tpope/vim-commentary")

  -- Syntax highlight
  use("sheerun/vim-polyglot")

  -- Fuzzy finder
  use({
    "junegunn/fzf",
    run = ":call fzf#install()"
  })
  use({
    "junegunn/fzf.vim",
    requires = {
      "junegunn/fzf",
    },
    config = function()
      require('doanphuduc.plugins.fzf')
    end
  })

  -- Statusline
  use({
    "vim-airline/vim-airline",
    config = function()
      require("doanphuduc.plugins.vim-airline")
    end
  })
  use("vim-airline/vim-airline-themes")

  -- Tmux status line
  use("edkolev/tmuxline.vim")

  -- Multiselection --> anti-patern in vim, can be removed in the future
  use("terryma/vim-multiple-cursors")

end
)



