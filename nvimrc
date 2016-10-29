"""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" rails
Plug 'rails.vim', {'for': 'ruby'}
Plug 'thoughtbot/vim-rspec', {'for': 'ruby'}
Plug 'slim-template/vim-slim', {'for': 'slim'}

" golang
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make'}
Plug 'zchee/deoplete-clang', {'for': 'c'}

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

Plug 'neomake/neomake'
Plug 'bitc/vim-bad-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'majutsushi/tagbar'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources#jedi#python_path='/usr/bin/python3'
set completeopt-=preview

set dictionary+=~/.dict
set complete+=k

let g:neomake_python_flake8_maker = {'args': ['--ignore=E124,E265,E402,E501,E226']}
let g:neomake_python_enabled_makers = ['flake8']
autocmd! BufRead * Neomake
autocmd! BufWritePost * Neomake

let g:ctrlp_prompt_mappings = {'AcceptSelection("e")': ['<c-t>'], 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>']}
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

" remember last open lines
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" tagbar
nmap <F8> :TagbarToggle<CR>


" vim-slim
filetype plugin indent on


" --- Base ---

" misc
autocmd BufNewFile,BufRead {*.py} :set colorcolumn=79
autocmd BufNewFile,BufRead {*.rb} :set colorcolumn=120
autocmd filetype crontab setlocal nobackup nowritebackup
set ls=1
set ai
set bs=2
set hls
set ic
set nu
set ruler
syntax enable

" encoding
" set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,shift-jis,gbk,big5,euc-jp
set termencoding=utf-8

" unix LF
set fileformat=unix
set fileformats=unix,dos,mac

" indent
set shiftwidth=2  " spaces per tab
set shiftround    " shiftwidth * n
set tabstop=8     " tab should look like 8 spaces
set softtabstop=8
set expandtab     " use spaces to instead of tabs
set smarttab      " so smart ;)

" colors
set t_Co=256
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

if system("uname -s") == "Darwin\n"
  set mouse=a
  set clipboard=unnamed
endif


" --- Pickups ---

" From c9s
map <S-H> gT
map <S-L> gt

" From Amir https://github.com/amireldor/amir-vim
function! ThinTabMode()
  echo "Thin Tab Mode"
  set et sts=2 sw=2
endfunction

function! NiceTabMode()
  echo "Nice Tab Mode"
  set et sts=4 sw=4
endfunction

function! FatTabMode()
  echo "Fat Tab Mode"
  set et sts=8 sw=8
endfunction

autocmd BufNewFile,BufRead {*} :silent call NiceTabMode()
autocmd BufNewFile,BufRead {*.vim,*.vimrc,*.yml,*.rb,*.slim,*.md} :silent call ThinTabMode()
autocmd BufNewFile,BufRead {*.go} :silent call FatTabMode()
