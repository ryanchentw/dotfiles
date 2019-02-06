" basic vim config
source ~/.vimrc

call plug#begin('~/.vim/plugged')

" utils
Plug 'neomake/neomake'
Plug 'bitc/vim-bad-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sophacles/vim-bundle-mako'

" auto-complete
Plug 'Shougo/deoplete.nvim'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make'}
Plug 'zchee/deoplete-clang', {'for': 'c'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}

" js
Plug 'mxw/vim-jsx', {'for': 'js'}
let g:jsx_ext_required = 0

Plug 'altercation/vim-colors-solarized'

call plug#end()

" --- Plugins ---

" solarized
set t_Co=256
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized


" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}


" jedi
let g:python_host_prog = glob('~/venv/nvim-py2/bin/python')
let g:python3_host_prog = glob('~/venv/nvim-py3/bin/python')


" neomake
let g:neomake_python_flake8_maker = {'args': ['--ignore=E124,E265,E402,E501,E226,E251,E221,E203']}
let g:neomake_python_enabled_makers = ['flake8']
autocmd! BufRead * Neomake
autocmd! BufWritePost * Neomake


" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let mapleader=","
let g:fzf_layout = {'down': '~25%'}
nnoremap <silent> <c-p> :Files<CR>
inoremap <expr> <c-x><c-k> fzf#complete('cat ~/.dict')


" tagbar
nmap <F8> :TagbarToggle<CR>


" vim-slim
filetype plugin indent on
