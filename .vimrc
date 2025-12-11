" ~/.vimrc: Vim configuration file

" Basic settings
set nocompatible              " Use Vim defaults
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable filetype detection

" Display settings
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set ruler                     " Show cursor position
set showcmd                   " Show command in bottom bar
set cursorline                " Highlight current line
set showmatch                 " Highlight matching brackets

" Search settings
set incsearch                 " Search as characters are entered
set hlsearch                  " Highlight search matches
set ignorecase                " Ignore case when searching
set smartcase                 " Smart case search

" Indentation settings
set tabstop=4                 " Number of spaces per tab
set shiftwidth=4              " Number of spaces for indentation
set expandtab                 " Use spaces instead of tabs
set smartindent               " Smart indentation
set autoindent                " Auto indentation

" Performance settings
set lazyredraw                " Don't redraw while executing macros

" Interface settings
set wildmenu                  " Visual autocomplete for command menu
set scrolloff=5               " Keep 5 lines above/below cursor
set backspace=indent,eol,start " Allow backspace over everything

" File handling
set autoread                  " Auto reload files changed outside vim
set encoding=utf-8            " Use UTF-8 encoding
set fileencoding=utf-8

" Backup and swap files
set nobackup                  " Don't create backup files
set nowritebackup
set noswapfile

" Color scheme
colorscheme desert            " Use desert color scheme

" Key mappings
let mapleader = ","           " Set leader key to comma
nnoremap <leader>w :w<CR>     " Quick save with ,w
nnoremap <leader>q :q<CR>     " Quick quit with ,q

" Clear search highlighting with Escape
nnoremap <silent> <Esc> :noh<CR><Esc>

" Navigate splits easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
