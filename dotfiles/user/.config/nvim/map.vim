" Disable pappings
nnoremap Q <nop>
map q <nop>
noremap ; :

" Goto to link
map <C-L> <C-]>

nmap <CR> O<ESC>

" Help mappings
map <F1> :h myvimdoc.txt<CR>
map <F25> :helptags ~/.config/nvim/doc/<CR>

" Disable cursor search
map <ESC> :noh<cr>

" shift+arrow selection
set keymodel=startsel,stopsel
"nmap <S-Up> v<Up>
"nmap <S-Down> v<Down>
"nmap <S-Left> v<Left>
"nmap <S-Right> v<Right>
"vmap <S-Up> <Up>
"vmap <S-Down> <Down>
"vmap <S-Left> <Left>
"vmap <S-Right> <Right>
"imap <S-Up> <Esc>v<Up>
"imap <S-Down> <Esc>v<Down>
"imap <S-Left> <Esc>v<Left>
"imap <S-Right> <Esc>v<Right>


" Copy/Paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui

" Save with CTRL-S
noremap <silent> <C-s>          :update<CR>
vnoremap <silent> <C-s>         <C-C>:update<CR>
inoremap <silent> <C-s>         <C-O>:update<CR>

" Quit with CTRL-Q
noremap <silent> <C-q>          :q<CR>
vnoremap <silent> <C-q>         <C-C>:q<CR>
inoremap <silent> <C-q>         <C-O>:q<CR>
