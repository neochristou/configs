execute pathogen#infect()
syntax on
colorscheme OceanicNext
let g:oceanic_next_terminal_italic = 1
filetype plugin indent on
set clipboard=unnamedplus

" Mappings
let mapleader = ","
map <C-o> :NERDTreeToggle<CR>
map <C-i> :Files<CR>
map <C-a> <esc>ggVG<CR>

" File navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Save file as sudo
command! -nargs=0 Sw w !sudo tee % > /dev/null

" Map Esc to Caps Lock when entering vim and remap it back to normal when
" exiting
" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Shellcheck current script
map <leader>k :!clear && shellcheck %<CR>

" Make install
map <leader>m :w <CR>:!sudo make install <CR>
map <leader>r dip 2ko <Esc>:read base16-st/build/base16-

" Run spellcheck
map <leader>s :setlocal spell!<CR>

" Set spelling language to greek
map <leader>l :set spelllang=el<CR>

" Need to add compiler shortcut from luke smithd

" Basic 

" Ignore search case by default
set ic

set number relativenumber
set wildmode=longest,list,full
set splitbelow splitright
set showcmd

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ["sh"],'passive_filetypes': ["c"] }
nnoremap <C-w>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1

" YCM settings
let g:ycm_extra_conf_globlist = ['~/.vim/bundle/youcompleteme/*','/media/neo/Storage/mozilla-central/*']
let g:ycm_auto_trigger = 1
