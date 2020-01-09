execute pathogen#infect()
syntax on
filetype plugin indent on
set clipboard=unnamedplus

" Mappings
let mapleader = ","
map <C-o> :NERDTreeToggle<CR>
map ; :Files<CR>
map <C-a> <esc>ggVG<CR>

" File navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shellcheck current script
map <leader>k :!clear && shellcheck %<CR>

" Run spellcheck
map <leader>s :setlocal spell!<CR>

" Set spelling language to greek
map <leader>l :set spelllang=el<CR>

" Need to add compiler shortcut from luke smithd

" Basic 
set number relativenumber
set wildmode=longest,list,full
set splitbelow splitright
set showcmd

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" YCM settings
let g:ycm_extra_conf_globlist = ['~/.vim/bundle/youcompleteme/*','/media/neo/Storage/mozilla-central/*']
