" Active leader key
call leaderGuide#register_prefix_descriptions(' ','g:lmap')
nnoremap <silent> <leader> :<c-u>LeaderGuide ' '<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ' '<CR>

" Init leader dictionary
let g:lmap =  {}

let g:lmap.c = { 'name' : 'Comment' }

" My leaders menu
let g:lmap.m = {
				\'name' : 'my leader',
				\'c' : ['ColorToggle','Hex Color'],
				\'k' : ['ShowMaps','Show key mapping'],
				\'s' : ['Startify','Show startify page'],
                \}

" Git map
let g:lmap.g = {
				\'name' : 'Git Menu',
				\'s' : ['Gstatus', 'Git Status'],
                \'p' : ['Gpull',   'Git Pull'],
                \'u' : ['Gpush',   'Git Push'],
                \'c' : ['Gcommit', 'Git Commit'],
                \'w' : ['Gwrite',  'Git Write'],
                \}
