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
