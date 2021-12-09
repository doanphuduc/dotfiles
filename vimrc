filetype off

set shell=sh

" Leader
let mapleader = " "

autocmd BufEnter * :set scroll=10
set mouse=a
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoindent
set smartindent

set autoread
set autowrite

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Use one space, not two, aion.
set nojoinspaces

" Numbers
" set relativenumber
set number
set numberwidth=5

" Open new speels more natural
set splitbelow
set splitright

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use verfs
set diffopt+=vertical

" Copy to clipboard
set clipboard=unnamed
set clipboard=unnamedplus

set lazyredraw
set termguicolors
set background=dark
set cursorline

filetype plugin indent on

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

colorscheme dracula

" When the type or syntax highlighting purposes.
let g:is_posix = 1

" Use tab with text block
vmap <Tab> >gv
vmap <S-Tab> <gv

" Split
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>- :split<CR>
noremap <silent> <C-S-Left> :vertical resize -5<CR>
noremap <silent> <C-S-Right> :vertical resize +5<CR>
noremap <silent> <C-S-Up> :resize +5<CR>
noremap <silent> <C-S-Down> :resize -5<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Alias write to W
nnoremap W :w<CR>
nnoremap Q :BD<CR>

" Remove highlight
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

noremap <F1> :NERDTreeToggle<CR>
nnoremap <F2>  :NERDTreeFind<CR>

" Commenting
map <Leader>/ gc 
autocmd FileType cpp setlocal commentstring=//\ %s
" Prevent continue commenting
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Switch buffer
nnoremap  <silent>   <Tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <S-Tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

let g:EasyMotion_smartcase = 1

" Search n-chars
map / <Plug>(easymotion-sn)

" Support moving between NERDTree pannel and vim 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Multi select
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_select_all_word_key = '<C-a>' 
let g:multi_cursor_quit_key = '<Esc>' 

" GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_sign_removed = 'X'

" Move lines up and down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Execute extended settings.
source ~/.nvim_settings/coc.vim
source ~/.nvim_settings/fzf.vim
source ~/.nvim_settings/airline.vim
source ~/.nvim_settings/nerdtree.vim
source ~/.nvim_settings/cpp_settings.vim
source ~/.nvim_settings/python_settings.vim

