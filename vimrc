colo elflord_fix
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set hlsearch
set smartindent
set nu

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set hlsearch
set incsearch
syntax enable
syntax on
set laststatus=1
set showmatch
set nocompatible 
set ruler
set rulerformat=%15(%f%V\ %p%%%)
set nobackup
set list
au BufRead,BufNewFile *.js colo javascript_color
au BufRead,BufNewFile *.js set syntax=javascript

" pathogen
execute pathogen#infect()
filetype plugin indent on

" F2 - 行号
nnoremap <F2> :set nonumber!<CR>
nnoremap <F1> :set nolist!<CR>

" 补全 Ctrl+R
set completeopt+=longest
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" python
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 20
let g:pymode_indent = 0
nnoremap <F10> :!python<CR>
