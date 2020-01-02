execute pathogen#infect()
syntax on
filetype plugin indent on
set clipboard=unnamedplus
map <C-o> :NERDTreeToggle<CR>
map ; :Files<CR>
map <C-a> <esc>ggVG<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:ycm_extra_conf_globlist = ['~/.vim/bundle/youcompleteme/*','/media/neo/Storage/mozilla-central/*']
