
set encoding=utf-8
scriptencoding utf-8

" Check if Vim Plug is installed else install it
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

" Plugins installation
call plug#begin('~/.local/share/vim/plugged')

" airline & font
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" TODO testing
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
"Plug 'SirVer/ultisnips'

" Note
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Autocompletion
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

"##################
" Deoplete
"##################

Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'zchee/deoplete-go'
Plug 'zchee/deoplete-zsh'
Plug 'sebastianmarkow/deoplete-rust'

"##################
"LSP
"##################
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

" (Optional) Multi-entry selection UI.
"Plug 'junegunn/fzf'

" (Completion plugin option 1)
"Plug 'roxma/nvim-completion-manager'
" (Completion plugin option 2)
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" global settings
set mouse=a
set number
"scriptencoding utf-8
"set encoding=utf-8
let g:mapleader = ','
set ignorecase

set cursorline
highlight CursorLine cterm=None ctermbg=black ctermfg=None

" Mapping
nnoremap Q <nop>
map q <nop>
noremap ; :
nmap <leader>d :NERDTreeToggle<cr>
"noremap <silent> <C-s>          :update<CR>
"vnoremap <silent> <C-s>         <C-C>:update<CR>
"inoremap <silent> <C-s>         <C-O>:update<CR>

" airline
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'base16'

" symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:AutoPairsMapCR=0

" python
let g:syntastic_python_checkers = ['pylint', 'rope']

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_smart_case = 1

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

imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

" Linter & Fixer
" Get plugin info with :ALEInfo
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
			\ 'python': ['flake8', 'mypy', 'pylint'],
			\ 'vim': ['vint'],
			\ 'zsh': ['shell'],
			\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
			\ 'vim': ['remove_trailing_lines','trim_whitespace'],
			\ 'python': ['autopep8', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
      \ }

" LSP
"set hidden

"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"    \ 'javascript': ['javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['javascript-typescript-stdio'],
"    \ }

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
