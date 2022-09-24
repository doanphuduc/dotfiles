filetype off
set shell=sh

" Leader
let mapleader = " "

" autocmd BufEnter * :set scroll=10
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


" Set favorite cursor in each mode
set guicursor=n-v-c-sm:block,i:block-blinkwait175-blinkoff150-blinkon175,ci-ve:ver25-Cursor,r-cr-o:hor20

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Make it obvious where 80 characters is
set textwidth=100
set colorcolumn=+1

" Use one space
set nojoinspaces

" Numbers
set number relativenumber

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

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
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
nnoremap <silent> < :vertical resize -5<CR>
nnoremap <silent> > :vertical resize +5<CR>
nnoremap <silent> + :resize +5<CR>
nnoremap <silent> _ :resize -5<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Mapping % to \, easier to use
map M %

" Behave like C, D
nnoremap Y y$

" Keeping it centered when searching
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Delete and paste
vnoremap <Leader>p "_dP

" Easier line-wise movement
nnoremap gh g^
nnoremap gl g$

" Alias write to W
nnoremap W :w<CR>
nnoremap Q :BD<CR>

" Allow misspelling
cnoreabbrev Q q

" Remove highlight
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>


" Set filetype for custom file
au BufRead,BufNewFile *.pconf set ft=pconf

" Commenting
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType pconf setlocal commentstring=#\ %s

" Prevent continue commenting
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Switch buffer
nnoremap  <silent>   <Tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <S-Tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Tab move completion from top to bot
let g:SuperTabDefaultCompletionType = "<c-n>"

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
let g:gitgutter_sign_removed = '-'

" Map
nnoremap <C-d> 10jzz
nnoremap <C-u> 10kzz

" Move lines up and down
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Execute extended settings.
source ~/.nvim_settings/coc.vim
source ~/.nvim_settings/fzf.vim
source ~/.nvim_settings/airline.vim
source ~/.nvim_settings/nerdtree.vim
source ~/.nvim_settings/cpp_settings.vim
source ~/.nvim_settings/python_settings.vim
source ~/.nvim_settings/visual-at.vim
source ~/.nvim_settings/ycm_settings.vim

