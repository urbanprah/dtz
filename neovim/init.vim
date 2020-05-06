"
" ███▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
" ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
"  ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"   ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"    ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"    ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"      ░░   ▒ ░░      ░     ░░   ░ ░
"       ░   ░         ░      ░     ░ ░
"      ░                           ░
"
" General
" =======
let mapleader = " "
syntax on
set encoding=utf-8
set clipboard+=unnamedplus

" Plugins
" =======
call plug#begin('$HOME/.config/nvim/plugged')
" Extended functionality
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim' " Can YCM do LSP symbols? -> coc.vim
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
"
" Appearance
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dylanaraps/wal.vim'
Plug 'gko/vim-coloresque'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

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
set termguicolors
colorscheme nord
set cursorline
"set cursorcolumn
"highlight CursorLine ctermbg=Green cterm=bold
"highlight CursorColumn ctermbg=Green cterm=bold
highlight FoldColumn ctermbg=0 ctermfg=0
highlight VertSplit ctermbg=1 ctermfg=1
highlight SignColumn ctermbg=0
highlight Visual ctermbg=10

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

" airline
" -------
let g:airline_theme = 'deus'

" vista
" -----
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fzf_preview = ['right:50%']
" Custom ucons
let g:vista#renderer#icons = {
                        \   "function": "\uf794",
                        \   "variable": "\uf71b",
                        \  }
let g:vista#renderer#enable_icon = 1
" Available executives: ['ale', 'coc', 'ctags', 'lcn', 'nvim_lsp', 'vim_lsc', 'vim_lsp']
let g:vista_default_executive = 'ctags'
" Explicit executive specification
let g:vista_executive_for = {
                        \ 'c': 'ctags',
                        \ 'php': 'nvim_lsp',
                        \ }
" Custom ctags commands
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }
" Show nearest method in statusline
function! NearestMethodOrFunction() abort
        return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
