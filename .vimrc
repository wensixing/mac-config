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
