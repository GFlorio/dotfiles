call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cohama/lexima.vim'
Plug 'valloric/youcompleteme'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'vim-scripts/ReplaceWithRegister'
call plug#end()

" ### LOOKS ###
syntax on                       " Enable syntax highlighting.
set cursorline                  " Highlight the current line.
set number                      " Show line number.
set relativenumber              " Show RELATIVE line numbers
set wildmenu                    " Visual autocomplete for command menu.
" set hlsearch                    " Enable search highlighting.
set incsearch                   " Search as characters are entered.
set showmatch                   " Highlight matching [{()}].
set colorcolumn=80,120          " Highlight line length limits
set t_Co=256                    " Use 256 colors
set background=light             " Tell vim we're on a dark terminal

" Workaround for https://github.com/vim/vim/issues/3608
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme breezy

" ### SPELL_CHECK ###
set spelllang=pt_br,en_us
set spell

" ### WINDOWS ###
set splitbelow                  " New hsplits are below
set splitright                  " New vsplits are right
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l
set wmh=1                       " Minimum window height

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
set shiftwidth=4
set foldmethod=indent
set foldlevel=99

" ### CUSTOM BINDINGS ###
let mapleader = '\'
nnoremap <leader><space> :nohlsearch<CR> " Clear search highlights
nnoremap <leader>w  vipgq " Reflow paragraph
nnoremap <leader>t :!python -m unittest %<CR> " Run tests in current file

" Highlight current word
set updatetime=100
hi CurrWord      cterm=bold,italic
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
        exec 'match' 'CurrWord' '/\V\<'.expand('<cword>').'\>/' 
    else 
        match none 
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

" ### PLUGIN CONFIGS ###
" # ctrlp
" Ignore files ignored by git
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Open new files in horizontal splits
let g:ctrlp_open_new_file = 'h'
" Open file in hsplit when <Enter> is pressed
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("h")': ['<c-h>', '<2-LeftMouse>'],
    \ 'AcceptSelection("e")': ['<cr>', '<RightMouse>'],
    \ }

" # youcompleteme
" Use virtualenv
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <leader>? :YcmCompleter GetDoc<CR>

" # ALE
let g:ale_python_mypy_options = '--strict-optional –-ignore-missing-imports'
let g:ale_open_list = 1
let g:ale_lint_delay = 300
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
nmap <leader>p <Plug>(ale_previous_wrap)
nmap <leader>n <Plug>(ale_next_wrap)
