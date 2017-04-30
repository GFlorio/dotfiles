call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cohama/lexima.vim'
Plug 'valloric/youcompleteme'
call plug#end()

" ### LOOKS ###
syntax on                       " Enable syntax highlighting.
set cursorline                  " Highlight the current line.
set number                      " Show line number.
set relativenumber              " Show RELATIVE line numbers
set wildmenu                    " Visual autocomplete for command menu.
set hlsearch                    " Enable search highlighting.
set incsearch                   " Search as characters are entered.
set showmatch                   " Highlight matching [{()}].
set colorcolumn=80,120          " Highlight line length limits
set t_Co=256                    " Use 256 colors
set background=dark             " Tell vim we're on a dark terminal
colorscheme solarized 

" ### SPELL_CHECK ###
set spelllang=pt,en
set spell
highlight clear SpellBad
highlight SpellBad term=reverse cterm=underline

" ### WINDOWS ###
set splitbelow                  " New hsplits are below
set splitright                  " New vsplits are right
" Better window navigation
nnoremap <C-h> <C-w>h<C-w>_
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-l> <C-w>l<C-w>_
nnoremap <C-Left> <C-w>h<C-w>_
nnoremap <C-Down> <C-w>j<C-w>_
nnoremap <C-Up> <C-w>k<C-w>_
nnoremap <C-Right> <C-w>l<C-w>_
set wmh=0                       " Minimum window height
set wh=9999                     " Default window height

" ### INNER WORKINGS ###
set backup
set writebackup
set backupdir=~/.vim/backups    " Set directory for backup files.
set directory=~/.vim/swaps      " Set directory for swap files.
set encoding=utf-8              " Use UTF-8.
set lazyredraw                  " Avoid drawing the screen when not necessary.
set ignorecase                  " Ignore case in search patterns.
set clipboard=unnamedplus       " Use 'default' register as clipboard
set wildmode=longest,list,full
set wildmenu

" ### INDENTATION AND FOLDING ###
filetype indent on              " Load filetype-specific indent files.
set autoindent                  " Copy indent to the new line.
set expandtab                   " Tabs are spaces.
set tabstop=4                   " Number of visual spaces per TAB.
set softtabstop=4               " Number of spaces in tab when editing.
set foldmethod=indent
set foldlevel=99

" ### CUSTOM BINDINGS ###
nnoremap <leader><space> :nohlsearch<CR> " Clear search highlights
nnoremap <space> za                      " Use space for folding

" ### PLUGIN CONFIGS ###
" # ctrlp
" Ignore files ignored by git
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Open new files in horizontal splits
let g:ctrlp_open_new_file = 'h'
" Open file in hsplit when <Enter> is pressed
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-h>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<cr>', '<RightMouse>'],
    \ }

" # youcompleteme
" Use virtualenv
let g:ycm_python_binary_path = 'python'
