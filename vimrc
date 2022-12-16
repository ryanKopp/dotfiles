set number relativenumber
syntax on
colorscheme onedark
set tabstop=4
set smartindent
set expandtab
set shiftwidth=4

autocmd FileType make set noexpandtab
autocmd FileType verilog set shiftwidth=2

" Lightline config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

if !has('gui_running')
    set t_Co=256
endif

call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'itchny/lightline.vim'

call plug#end()
