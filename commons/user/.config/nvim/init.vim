set encoding=utf-8
scriptencoding utf-8

" Check if Vim Plug is installed else install it (check first time)
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	augroup pluginInstall
		autocmd!
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	augroup END
endif
call plug#begin('~/.local/share/vim/plugged')

" Vim starting screen
Plug 'mhinz/vim-startify'
    let g:startify_custom_header = [
\ '          ██████╗  ██████╗  ██████╗██╗  ██╗███████╗██████╗         ',
\ '          ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗        ',
\ '          ██║  ██║██║   ██║██║     █████╔╝ █████╗  ██████╔╝        ',
\ '          ██║  ██║██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗        ',
\ '          ██████╔╝╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║        ',
\ '          ╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝        ',
\ '                                                                ',
\ '      ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗',
\ '      ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝',
\ '      ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗',
\ '      ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║',
\ '      ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║',
\ '      ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝',
\]

" TODO TESTING
"Plug 'SirVer/ultisnips'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'

" Leadguide
Plug 'hecal3/vim-leader-guide'

" Detect root project directory
Plug 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1

" ctags
Plug 'xolox/vim-misc'                                           " Used by easytags
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" Code completion & syntax highlighting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'                                     " Some languages
Plug 'zchee/deoplete-jedi', { 'for': 'python' }                 " Python
Plug 'zchee/deoplete-go'                                        " Go
Plug 'zchee/deoplete-zsh'                                       " ZSH
Plug 'sebastianmarkow/deoplete-rust'                            " Rust
Plug 'saltstack/salt-vim'                                       " Salt
Plug 'chrisbra/Colorizer'                                       " Hex colors
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_start_length = 1
"let g:deoplete#enable_smart_case = 1

" Airline
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Font icons for some plugins
" (NERDTree, vim-airline, Powerline, Unite, vim-startify and more)
Plug 'ryanoasis/vim-devicons'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'


" Linter & Fixer
Plug 'w0rp/ale'
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
			\ 'json': ['jsonlint'],
			\ 'python': ['flake8', 'mypy', 'pylint'],
			\ 'vim': ['vint'],
			\ 'zsh': ['shell'],
			\}
let g:ale_fixers = {
			\ 'sh': ['shfmt'],
			\ 'json': ['fixjson'],
			\ 'javascript': ['eslint'],
			\ 'vim': ['remove_trailing_lines','trim_whitespace'],
			\ 'python': ['autopep8', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
			\ }

"Plug 'kien/rainbow_parentheses.vim'
"let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['black',       'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]
"augroup rainbow
    "au VimEnter * RainbowParenthesesToggle
    "au VimEnter * RainbowParenthesesLoadRound
    "au VimEnter * RainbowParenthesesLoadSquare
    "au VimEnter * RainbowParenthesesLoadBraces
    "au VimEnter * RainbowParenthesesLoadChevrons
"augroup END

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapCR=0
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

"Plug 'Shougo/neco-vim', { 'for': 'vim' }
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

" Ripgrep integration, also used in NERDTree menu
Plug 'jremmen/vim-ripgrep'

" File Manager
Plug 'scrooloose/nerdtree'              " File manager
Plug 'Xuyuanp/nerdtree-git-plugin'      " Show git state in nerdtree
Plug 'masaakif/nerdtree-useful-plugins' " Grep menu for nerdtree
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Clean'     : '✔︎',
    \ 'Ignored'   : '☒',
    \ 'Unknown'   : '?',
    \ }

" Close NERDTree if only this buffer is opened
augroup nerdtree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END<Paste>

let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:rg_command = "rg --iglob '!.git' --vimgrep --follow --ignore-case --hidden"

" Comments tool
Plug 'scrooloose/nerdcommenter'         " Comment tools

call plug#end()

" Global settings
set mouse=a
set number
let g:mapleader = ' '
set ignorecase
set cursorline
set fillchars+=vert:│

" Tabulation
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4

" Filetype
filetype plugin on
filetype indent on

" Configure clip board
set clipboard=unnamed,unnamedplus

" Allow switch buffers if unsaved
set hidden

source ~/.config/nvim/map.vim

if !empty(glob('~/.local/share/vim/plugged/vim-leader-guide/autoload/leaderGuide.vim'))
    source ~/.config/nvim/leader.vim
endif


if !empty(glob('~/.local/share/vim/plugged/fzf.vim/autoload/fzf/vim.vim'))
    source ~/.config/nvim/search.vim
endif

augroup filetypedetect
    	au BufRead,BufNewFile *.Jenkinsfile set filetype=groovy
augroup END

function! ShowColors()
let l:num = 255
while l:num >= 0
    exec 'hi col_'.l:num.' ctermbg='.l:num.' ctermfg=white'
    exec 'syn match col_'.l:num.' "ctermbg='.l:num.':...." containedIn=ALL'
    call append(0, 'ctermbg='.l:num.':....')
    let l:num = l:num - 1
endwhile
endfunction

" Colors
let &colorcolumn=join(range(81,999),',')
highlight CursorLine cterm=None ctermbg=233 ctermfg=None
highlight Visual cterm=None ctermbg=7 ctermfg=0
highlight Search cterm=None ctermbg=2 ctermfg=0
highlight ColorColumn ctermbg=234
"highlight SignColumn ctermbg=0
highlight clear SignColumn

augroup colors
	au InsertEnter * hi CursorLine cterm=NONE ctermbg=0 ctermfg=None
	au InsertLeave * hi CursorLine cterm=None ctermbg=233 ctermfg=None
augroup END

"let g:syntastic_python_checkers = ['pylint', 'rope']

"imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
"imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
