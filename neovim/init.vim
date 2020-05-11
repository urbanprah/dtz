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
"
" Plug-ins
" ========
call plug#begin('$HOME/.config/nvim/plugged')
" Extended functionality
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
"Plug 'machakann/vim-sandwich' --> different surround implementation
"Plug 'svermeulen/vim-yoink' " delete goes to black hole buffer
"Plug 'svermeulen/vim-cutlass' " yank history
"Plug 'svermeulen/vim-subversive' " visual select -> replace all matches
"Plug '/glts/vim-radical' " quick number conversion (dec/hex/oct/bin)
Plug 'tpope/vim-repeat'
Plug 'liuchengxu/vista.vim'
"Plug 'ycm-core/YouCompleteMe' " --> coc
Plug 'neoclide/coc.nvim', {'branch': 'release'} "
"Plug 'lifepillar/vim-mucomplete' " --> YCM | built-in completion
"Plug 'scrooloose/nerdtree' " --> netrw | system file manager in tmux
"Plug 'Shougo/defx.nvim' " --> alternative to nerdtree
"Plug 'KabbAmine/vCoolor.vim' " --> system color picker
"Plug 'terryma/vim-multiple-cursors'
"Plug 'easymotion/vim-easymotion' " Big meh
"Plug 'tpope/vim-fugitive' # TODO
Plug 'tpope/vim-commentary'
"Plug 'preservim/nerdcommenter'
"Plug 'tpope/vim-classpath' " JVM languages path (gf, :find)
"Plug 'tpope/vim-capslock' " virtual CAPSLOCK (esc, CAPSLOCK)

" Filetype specific
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"Plug 'myhere/vim-nodejs-complete'

" Miscellaneous
"Plug 'sheerun/vim-polyglot'
"Plug 'mhinz/vim-startify'
"
" Appearance
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()


" Behavior
" ========
let mapleader = ' '
syntax on
set encoding=utf-8
set nocompatible
set spell spelllang=en_us,sl_si
set directory=~/.cache/nvim/ " Swap directory
set clipboard+=unnamedplus " Use system clipboard
set updatetime=300 " Swap write interval [ms]
set shortmess+=c " Don't pass messages to ins-completion-menu
set hidden " Hide buffer
set smartcase
set mouse=n " Enable mouse in normal mode
set cindent " smartindent
set scrolloff=0 " Lines above/below cursor when scrolling
autocmd FileType * setlocal formatoptions-=cro " Disable auto comment
" Preserve cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
                        \ exe "normal! g`\"" | endif
" Preserve folds
autocmd BufWinLeave * :norm zM<CR>
augroup remember_folds
        autocmd!
        autocmd BufWinLeave ?* mkview 1
        autocmd BufWinEnter ?* silent! loadview 1
augroup END
" Tabs
" Number of spaces in a tab
set expandtab " Spaces instead of tabs
set shiftwidth=8
set softtabstop=8
set tabstop=8
set wildmode=longest,list,full " :Command tab completion
set splitbelow splitright " Splits open where you would expect them to
" Center cursor on insert mode
autocmd InsertEnter * norm zz
" Remove trailing whitespace, blank lines on write
function! <SID>StripTrailingWhitespaces()
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        0;/^\%(\_s*\S\)\@!/,$d
        let @/=_s
        call cursor(l, c)
endfunction
autocmd BufWritePre * silent! call <SID>StripTrailingWhitespaces()


" Key map
" =======
" Toggle Auto Comment
map <leader><S-c> :setlocal formatoptions-=cro<CR>
map <leader>c :setlocal formatoptions=cro<CR>
" Quick substitution
noremap <C-s> :%s//g<Left><Left>
vnoremap <C-S-s> :s//g<Left><Left>
" Split navigation, resize, swap
nnoremap <silent> <C-Right> :vertical resize +3<CR>
nnoremap <silent> <C-Left> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Clear highlighted text
nnoremap <F3> :set hlsearch!<CR>
" List of errors window
nnoremap <leader>e :copen<CR>
" Terminal inside Vim -> why
"map <leader>tt :vnew term://zsh<CR>

" Plug-in key maps
" ----------------
" [vim-surround]
nmap <leader>s ysiw
nmap <leader><S-s> yss

" [coc.vim]
" Trigger completion with <TAB>
inoremap <silent><expr> <TAB>
                        \ pumvisible() ? "\<C-n>" :
                        \ <SID>check_back_space() ? "\<TAB>" :
                        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Trigger completion.
"inoremap <silent><expr> <C-c> coc#refresh() " TODO necessary?
" Select completion suggestion with Enter; <C-g>u breaks completion
if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Quick fix for current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Coc diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Coc extensions
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Coc commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Symbol list
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" TODO (difference from previous) Leader symbols.
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Navigate symbols
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" TODO Resume latest Coc leader list.
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>
" Formatting selected code.
augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)
" Show documentation
function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
        else
                call CocAction('doHover')
        endif
endfunction
nnoremap <leader>d :call <SID>show_documentation()<CR>
" TODO Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
" TODO Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
" TODO Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
" TODO Use <TAB> for selections ranges. WARNING: it disables <C-i> navigation
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" [markdown-preview]
" ------------------
nmap <leader>m <Plug>MarkdownPreview
nmap <leader><S-m> <Plug>StopMarkdownPreview

" [fzf.vim]
" ---------


" Appearance
" ==========
set cmdheight=1
set signcolumn=yes " Column left of line numbers
set number relativenumber " Line numbers
set termguicolors " Use true colors
set t_Co=256 " *-256color terminals compatibility
colorscheme atom " ayu jellybeans
set cursorline
set cursorcolumn


" File specific auto commands
" ===========================
autocmd BufWritePost $HOME/.local/src/dwmblocks/scripts/* :!pkill -RTMIN+0 dwmblocks

" Plug-in configuration
" =====================
" vista
" -----
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fzf_preview = ['right:50%']
" Custom icons
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

" coc.vim
" -------
" TODO (does it work?) Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Organize imports using :OR
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')
" TODO (Do I need this?)
"command! -nargs=0 Format :call CocAction('format')
"command! -nargs=? Fold :call CocAction('fold', <f-args>)
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" TODO coc-airline (:h coc-statusline)
"
" vim-comentary
" -------------
autocmd FileType apache setlocal commentstring=#\ %s

" markdown-preview
" ----------------
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 1 " Markdown preview available for all file types
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = 'nvim - ${name}'

" airline
" -------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#enabled = 1
" TODO

" hexokinase
" ----------
" Highliters: virtual, sign_column, background, backgroundfull, foreground, foregroundfull
let g:Hexokinase_highlighters = [ 'virtual' ]
" Patterns: full_hex, triple_hex, rgb, rgba, hsl, hsla, colour_names
let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'
let g:Hexokinase_refreshEvents = [ 'BufRead', 'TextChanged' ]
