" Active leader key
call leaderGuide#register_prefix_descriptions(' ','g:lmap')
nnoremap <silent> <leader> :<c-u>LeaderGuide ' '<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ' '<CR>

" Init leader dictionary
"let g:lmap =  {' ': {'name': 'MYSEARCH'}}

let g:lmap = {}

let g:lmap.c = { 'name' : 'Comment' }

" Search menu
let g:lmap.f = {
				\'name' : 'Find',
                \'c': ['Content','Search content text'],
                \'g': ['Commits','Search in commits'],
                \'f': ['call FzSearchFiles()','Search git/files'],
                \}
nnoremap <C-f>c :Contents<CR>
nnoremap <C-f>f :Files<CR>
nnoremap <C-f>g :Commits<CR>
nmap fc :Contents<CR>
nmap ff :Files<CR>
nmap fg :Commits<CR>

" My leaders menu
let g:lmap.m = {
				\'name' : 'my leader',
				\'c' : ['ColorToggle','Hex Color'],
				\'k' : ['ShowMaps','Show key mapping'],
				\'s' : ['Startify','Show startify page'],
                \}

" leader sync key mapping
nmap <silent> mc :ColorToggle<CR>
nmap <silent> ms :Startify<CR>
nmap <silent> mk :call ShowMaps()<CR>

" Git map
"let g:lmap.g = {
				"\'name' : 'Git Menu',
				"\'s' : ['Gstatus', 'Git Status'],
                "\'p' : ['Gpull',   'Git Pull'],
                "\'u' : ['Gpush',   'Git Push'],
                "\'c' : ['Gcommit', 'Git Commit'],
                "\'w' : ['Gwrite',  'Git Write'],
                "\}
