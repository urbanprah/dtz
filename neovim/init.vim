"
"███▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
"▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
" ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"  ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"   ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"   ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"   ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"     ░░   ▒ ░░      ░     ░░   ░ ░
"      ░   ░         ░      ░     ░ ░
"     ░                           ░
"
" General
" =======
let mapleader=" "
syntax on
set encoding=utf-8
set clipboard+=unnamedplus


" Behaviour
" =========
" Enable mouse in normal mode
set mouse=n
set smartindent
"set cindent
" Tabs
set expandtab
set shiftwidth=8
set softtabstop=8
set tabstop=8
" Tab completion
set wildmode=longest,list,full
" Splits open where you would expect them to
set splitbelow splitright
" Center cursor on insert mode
autocmd InsertEnter * norm zz
" Remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e


" Keymap
" ======
" Toggle Auto Comment, Indentation
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>
" Spell checker (z= to show corrections)
map <leader>s :setlocal spell! spelllang=en_us<CR>
map <leader>S :setlocal spell! spelllang=sl_si<CR>
" Quick substitution
nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>
" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"nnoremap <leader>j :sp<Space>
"nnoremap <leader>h :vsp<Space>
" Clear highlighted text
nnoremap <F3> :set hlsearch!<CR>


" Appearance
" ==========
set number relativenumber
"set termguicolors
"colorscheme nord
set cursorline
"set cursorcolumn
"highlight CursorLine ctermbg=Green cterm=bold
"highlight CursorColumn ctermbg=Green cterm=bold
highlight FoldColumn ctermbg=0 ctermfg=0
highlight VertSplit ctermbg=1 ctermfg=1
highlight SignColumn ctermbg=0
highlight Visual ctermbg=10


" Plugins
" =======
call plug#begin('$HOME/.config/nvim/plugged')
        " Appearance
        Plug 'flazz/vim-colorschemes'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'ryanoasis/vim-devicons'
        Plug 'dylanaraps/wal.vim'
        Plug 'gko/vim-coloresque'
        "Plug 'junegunn/goyo.vim'
        "Plug 'junegunn/limelight.vim'

        " Extended functionality
        Plug 'tpope/vim-surround'
        Plug 'junegunn/fzf.vim'
        Plug 'liuchengxu/vista.vim'
        "Plug 'ycm-core/YouCompleteMe'
        "Plug 'neoclide/coc.nvim', {'branch': 'release'} " --> YCM
        "Plug 'lifepillar/vim-mucomplete' " --> YCM | built-in completion
        "Plug 'scrooloose/nerdtree' " --> netrw | system file manager in tmux
        "Plug 'KabbAmine/vCoolor.vim' " --> system color picker

        " Filetype specific
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
        "Plug 'myhere/vim-nodejs-complete'

        " Miscellaneous
        "Plug 'mhinz/vim-startify'
call plug#end()

" Plugin configuration
" ====================

" markdown-preview
" ----------------
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 1
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
