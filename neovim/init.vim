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
let mapleader = ' '
syntax on
set encoding=utf-8
set clipboard+=unnamedplus
set nofixeol
"set spell spelllang=en_us,sl_si
" coc TODO
"set hidden
"set nobackup
"set nowritebackup
"set cmdheight=2
"set updatetime=300
"set shortmess+=c
"set signcolumn=yes


" Plugins
" =======
call plug#begin('$HOME/.config/nvim/plugged')
" Extended functionality
Plug 'tpope/vim-surround'
"Plug 'machakann/vim-sandwich' --> different surround implementation
"Plug 'svermeulen/vim-yoink' " delete goes to blackhole buffer
"Plug 'svermeulen/vim-cutlass' " yank history
"Plug 'svermeulen/vim-subversive' " visual select -> replace all matches
"Plug '/glts/vim-radical' " quick number conversion (dec/hex/oct/bin)
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf'
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
"Plug 'tpope/vim-classpath' " JVM languages path (gf, :find)
"Plug 'tpope/vim-capslock' " virtual CAPSLOCK (esc, CAPSLOCK)

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
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
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
" Disable auto comment
autocmd FileType * setlocal formatoptions-=cro


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
" Remove trailing whitespace, blank lines on write
function TrimTrailingLines()
    let save_cursor = getpos(".")
    let lastLine = line('$')
    let lastNonblankLine = prevnonblank(lastLine)
    if lastLine > 0 && lastNonblankLine != lastLine
            silent! execute lastNonblankLine + 1 . ',$delete _'
    endif
    execute '$norm o'
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimTrailingLines()
autocmd BufWritePre * %s/\s\+$//e

" Keymap
" ======
" Toggle Auto Comment
map <leader><S-c> :setlocal formatoptions-=cro<CR>
map <leader>c :setlocal formatoptions=cro<CR>
" Quick substitution
noremap <C-s> :%s//g<Left><Left>
vnoremap <C-S-s> :s//g<Left><Left>
" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"nnoremap <leader>j :sp<Space>
"nnoremap <leader>h :vsp<Space>
" Clear highlighted text
nnoremap <F3> :set hlsearch!<CR>
nnoremap <leader>p :copen<CR>


" Appearance
" ==========
set number relativenumber
set termguicolors
set t_Co=256
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

" surround
" --------
nmap <leader>s ysiw
nmap <leader><S-s> yss


" repeat
" ------
" fzf
" TODO
" ---
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


" coc
" ---
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
inoremap <silent><expr> <C-c> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent> <;>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent> <;>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent> <;>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent> <;>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent> <;>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <;>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <;>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent> <;>p  :<C-u>CocListResume<CR>


" comentary
" ---------
autocmd FileType apache setlocal commentstring=#\ %s


" markdown-preview
" ----------------
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
" Markdown preview available for all filetypes
let g:mkdp_command_for_global = 1
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = 'nvim - ${name}'
nmap <leader>m <Plug>MarkdownPreview
nmap <leader><S-m> <Plug>StopMarkdownPreview


" colorschemes
" ------------
" airline
" -------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#enabled = 1
" TODO

" wal
" ---
" hexokinase
" Highliters: virtual, sign_column, background, backgroundfull, foreground, foregroundfull
let g:Hexokinase_highlighters = [ 'virtual' ]
" Patterns: full_hex, triple_hex, rgb, rgba, hsl, hsla, colour_names
let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'
let g:Hexokinase_refreshEvents = [ 'BufRead', 'TextChanged' ]

" ----------
" vim-devicons
" ------------


" kite " extremely fast python completion
" ----
"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
"set laststatus=2  " always display the status line
"let g:kite_auto_complete=1

