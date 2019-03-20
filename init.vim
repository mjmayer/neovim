" Put these lines at the very end of your vimrc file.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
" autocmd vimenter * NERDTree
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
" set indent
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set smartindent
set autoindent
set splitright
" save file automatically if :make is called
set autowrite
" Enable completion where available.
let g:ale_completion_enabled = 1
let g:deoplete#enable_at_startup = 1
" shows go functions in directory by pres \gt
au FileType go nmap <leader>gt :GoDeclsDir<cr>
" go to definition go back by C-t
au FileType go nmap <F12> :GoDef<cr>
" map exit for neovim terminal
:tnoremap <Esc> <C-\><C-n>
" set tab for yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
" set s and S for a single insert
:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" Grepper Config
nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0

" Set vim-go highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:deoplete#sources#go#gocode_binary = '/home/vagrant/go/bin/gocode'

" set javascript linter to use eslint
let g:ale_linters = {'javascript': ['eslint']}
" set javascript fixer to eslint
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
" do not appy ale fixer on save
let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 0

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
Plug 'thiagoalmeidasa/vim-ansible-vault'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-jedi'
Plug 'mhinz/vim-grepper'
else
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-go', { 'do': 'make'}
endif
call plug#end()
colorscheme solarized8
