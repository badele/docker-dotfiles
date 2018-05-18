set encoding=utf-8
scriptencoding utf-8

" Check if Vim Plug is installed else install it (check first time)
if has('nvim')
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		augroup pluginInstall
			autocmd!
			autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		augroup END
	endif
else
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		augroup pluginInstall
			autocmd!
			autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		augroup END

	endif
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
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'hecal3/vim-leader-guide'


" Code completion & syntax highlighting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'                                     " Some languages
Plug 'zchee/deoplete-jedi', { 'for': 'python' }                 " Python
Plug 'zchee/deoplete-go'                                        " Go
Plug 'zchee/deoplete-zsh'                                       " ZSH
Plug 'sebastianmarkow/deoplete-rust'                            " Rust
Plug 'saltstack/salt-vim'                                       " Salt
Plug 'chrisbra/Colorizer'                                       " Hex colors
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_smart_case = 1

set keymodel=startsel,stopsel

" Ripgrep integration, also used in NERDTree menu
Plug 'jremmen/vim-ripgrep'

" Airline
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Font icons for some plugins
" (NERDTree, vim-airline, Powerline, Unite, vim-startify and more)
Plug 'ryanoasis/vim-devicons'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1

"Plug 'ctrlpvim/ctrlp.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Plug 'SirVer/ultisnips'

" Linter & Fixer
Plug 'w0rp/ale'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
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
"	au VimEnter * RainbowParenthesesToggle
"	au VimEnter * RainbowParenthesesLoadRound
"	au VimEnter * RainbowParenthesesLoadSquare
"	au VimEnter * RainbowParenthesesLoadBraces
"	au VimEnter * RainbowParenthesesLoadChevrons
"augroup END

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapCR=0
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

"Plug 'Shougo/neco-vim', { 'for': 'vim' }
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

" Customization
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'masaakif/nerdtree-useful-plugins'
map <C-d> :NERDTreeToggle<CR>
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
"augroup nerdtree
"	autocmd StdinReadPre * let s:std_in=1
"	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"augroup END

let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:rg_command = "rg --iglob '!.git' --vimgrep --follow --ignore-case --hidden"

call plug#end()

" Global settings
set mouse=a
set number
let g:mapleader = ','
set ignorecase
set cursorline

" Tabulation
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4

" Configure clip board
set clipboard=unnamed,unnamedplus

" Allow switch buffers if unsaved
set hidden
set fillchars+=vert:│

source ~/.config/nvim/map.vim
source ~/.config/nvim/leader.vim

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
