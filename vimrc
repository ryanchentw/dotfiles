call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'

call plug#end()

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
if !has("nvim")
    set encoding=utf-8
endif
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

" clip
if system("uname -s") == "Darwin\n"
  set mouse=a
  set mouse-=a
  set clipboard=unnamed
else
  set mouse-=a
endif

" let g:loaded_ruby_provider = 1
set completeopt-=preview
if has('nvim-0.2.0')
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
  set inccommand=split
endif

" remember last open lines
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" bypass the neovim feature
if has("nvim")
    inoremap <c-c> <esc>
endif

au BufRead,BufNewFile Makefile* set noexpandtab


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

function! PythonDoc()
    set iskeyword+=.
    " nnoremap <buffer> H :<C-u>execute "!pydoc " . expand("<cword>")<CR>
endfunction

autocmd BufNewFile,BufRead {*.py} :silent call PythonDoc()
autocmd BufNewFile,BufRead {*} :silent call NiceTabMode()
autocmd BufNewFile,BufRead {*.vim,*.vimrc,*.yml,*.rb,*.slim,*.md} :silent call ThinTabMode()
autocmd BufNewFile,BufRead {*.go} :silent call FatTabMode()
autocmd BufNewFile,BufRead {Makefile*} :set noexpandtab shiftwidth=8 softtabstop=0


set completeopt=menu,menuone,noselect

" solarized
set t_Co=256
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let mapleader=","
let g:fzf_layout = {'down': '~25%'}
nnoremap <silent> <c-p> :Files<CR>
inoremap <expr> <c-x><c-k> fzf#complete('cat ~/.dict')
