" ### LOOKS ###
syntax on                       " Enable syntax highlighting.
set cursorline                  " Highlight the current line.
set number                      " Show line number.
set relativenumber
set wildmenu                    " Visual autocomplete for command menu.
set hlsearch                    " Enable search highlighting.
set incsearch                   " Search as characters are entered.
set showmatch                   " Highlight matching [{()}].


" ### INNER WORKINGS ###
set backup
set writebackup
set backupdir=~/.vim/backups    " Set directory for backup files.
set directory=~/.vim/swaps      " Set directory for swap files.
set encoding=utf-8              " Use UTF-8.
set lazyredraw                  " Avoid drawing the screen when not necessary.
set ignorecase                  " Ignore case in search patterns.


" ### INDENTATION ###
filetype indent on              " Load filetype-specific indent files.
set autoindent                  " Copy indent to the new line.
set expandtab                   " Tabs are spaces.
set tabstop=4                   " Number of visual spaces per TAB.
set softtabstop=4               " Number of spaces in tab when editing.


" ### CUSTOM BINDINGS ###
nnoremap <leader><space> :nohlsearch<CR> " Clear search highlights

