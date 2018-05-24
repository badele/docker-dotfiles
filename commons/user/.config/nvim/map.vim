" Disable pappings
nnoremap Q <nop>
map q <nop>
noremap ; :

" Startify
nmap <silent> ss :Startify<CR>

" Goto to link
map <silent> <C-L> <C-]>

" Help mappings
map <silent> <F1> :h MyHelp<CR>
map <silent> <F25> :helptags ~/.config/nvim/doc/<CR>

" Disable cursor search
map <silent> <ESC> :noh<cr>

" shift+arrow selection
set keymodel=startsel,stopsel
nmap <silent> <S-Up> V
nmap <silent> <S-Down> V
vmap <silent> <S-Up> k
vmap <silent> <S-Down> j

" NERDTree
map <silent> <C-d> :NERDTreeToggle<CR>

" Linter & Fixer
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Buffer navigation, used by airlines(tablines)
nmap <silent> <C-Right> :bprevious<CR>
nmap <silent> <C-Left> :bnext<CR>

" Comment
nmap <silent> cc <Plug>NERDCommenterToggle
vmap <silent> cc <Plug>NERDCommenterToggle<CR>gv
nmap <silent> cu <Plug>NERDCommenterToggle
vmap <silent> cu <Plug>NERDCommenterToggle<CR>gv

" Copy/Paste
vmap <silent> <C-c> y<Esc>i
vmap <silent> <C-x> d<Esc>i
map  <silent> <C-v> pi
imap <silent> <C-v> <Esc>pi
imap <silent> <C-z> <Esc>ui

" Save with CTRL-S
noremap <silent> <C-s>          :update<CR>
vnoremap <silent> <C-s>         <C-C>:update<CR>
inoremap <silent> <C-s>         <C-O>:update<CR><Esc>

" Quit with CTRL-Q
noremap <silent> <C-q>          :q<CR>
vnoremap <silent> <C-q>         <C-C>:q<CR>
inoremap <silent> <C-q>         <C-O>:q<CR>

function! s:ShowMaps()
  let l:old_reg = getreg("a")          " save the current content of register a
  let l:old_reg_type = getregtype("a") " save the type of the register as well
try
  redir @a                           " redirect output to register a
  " Get the list of all key mappings silently, satisfy "Press ENTER to continue"
  silent map | call feedkeys("\<CR>")
  redir END                          " end output redirection
  vnew                               " new buffer in vertical window
  put a                              " put content of register
  " Sort on 4th character column which is the key(s)
  %!sort -k1,14
finally                              " Execute even if exception is raised
  call setreg("a", l:old_reg, l:old_reg_type) " restore register a
endtry
endfunction
com! ShowMaps call s:ShowMaps()      " Enable :ShowMaps to call the function
