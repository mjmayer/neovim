" Put these lines at the very end of your vimrc file.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
" Enable completion where available.
let g:ale_completion_enabled = 1
map <leader>nt :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" enable syntax highlighting
syntax on
" map gt to next tab
map gt :tabn<CR>
" map gT to previous tab
map gT :tabp<CR>
set background=dark
colorscheme solarized8
" set indent
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set smartindent
set autoindent
set splitright
" save file automatically if :make is called
set autowrite
" Toggle quickfix list for vim-go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:deoplete#enable_at_startup = 1
" shows go functions in directory by pres \gt
au FileType go nmap <leader>gt :GoDeclsDir<cr>
" go to definition go back by C-t
au FileType go nmap <F12> :GoDef<cr>
" map exit for neovim terminal
:tnoremap <Esc> <C-\><C-n>


" VIM Plug section
call plug#begin()
if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode', { 'rtp': 'nvim'}
Plug 'tpope/vim-fugitive'
Plug 'sebdah/vim-delve'
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'lifepillar/vim-solarized8'
" Plug 'b4b4r07/vim-ansible-vault'
Plug 'thiagoalmeidasa/vim-ansible-vault'
else
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'b4b4r07/vim-ansible-vault'
endif
call plug#end()
