call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

set number relativenumber
syntax on
set tabstop=4
set smartindent
set expandtab
set shiftwidth=4

"nnoremap("<C-d>", "<C-d>zz")
"nnoremap("<C-u>", "<C-u>zz")

autocmd FileType make set noexpandtab
autocmd FileType verilog set shiftwidth=2

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark

" Lightline config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

if !has('gui_running')
    set t_Co=256
endif

