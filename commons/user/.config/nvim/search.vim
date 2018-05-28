" Search GitFiles or Files
function! g:FzSearchFiles()
    let l:is_git = system('git status')
    if v:shell_error
        call fzf#vim#files('', fzf#vim#with_preview('right'))
    else
        call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))
    endif
endfunction

command! -bang -nargs=? Files call FzSearchFiles()
command! -bang -nargs=* Contents
  \ call fzf#vim#ag(<q-args>,'--smart-case --hidden',fzf#vim#with_preview('right:50%'),
  \                 <bang>0)

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_files_options =
  \ '--preview "(highlight -O xterm256 {} || cat {}) 2> /dev/null | head -'.&lines.'"'
