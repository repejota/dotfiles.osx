set nocompatible
set encoding=utf-8
set ffs=unix,dos,mac

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Tabular information
" 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Cursorline
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" File formats:
"
" *.md, *.markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md setlocal filetype=ghmarkdown
    au BufNewFile,BufRead *.markdown setlocal filetype=ghmarkdown
augroup END
" *.py
au BufRead,BufNewFile *.py  set ai sw=4 sts=4 et tw=72
au BufNewFile *.py set fileformat=unix
" *.js
au BufRead,BufNewFile *.js  set ai sw=4 sts=4 et tw=72
au BufNewFile *.js set fileformat=unix
" *.php
au BufRead,BufNewFile *.php  set ai sw=4 sts=4 et tw=72
au BufNewFile *.php set fileformat=unix
" *.html
au BufRead,BufNewFile *.html set ai sw=4 sts=4 et tw=72
au BufNewFile *.html set fileformat=unix
" *.json
au! BufRead,BufNewFile *.json setfiletype json
au BufRead,BufNewFile *.json set ai sw=4 sts=4 et tw=72
au BufNewFile *.py set fileformat=unix

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Status line
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

" Syntax on
syntax on
colorscheme Tomorrow-Night

" Mouse support
set mouse=a
set mousehide

" Searching and Patterns
set hlsearch                " Highlight matches to the search
set showmatch
set ignorecase              " Search is case insensitive
set smartcase               " Search case sensitive if caps on
set incsearch               " Show best match so far

" Display
set lazyredraw              " Don't repaint when scripts are running
set ruler                   " Line numbers and column the cursor is on
set number                  " Show line numbering
set numberwidth=1           " Use 1 col + 1 space for numbers
set autoindent
set history=1000
set cursorline
set showbreak=↝\ \ \ 

set vb t_vb=                    " No flash bell
set noerrorbells                " No beeps
set backspace=indent,eol,start
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set laststatus=2                " Always show status bar

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Ruler at 78
let &colorcolumn="80,".join(range(120,999),",")

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Keyboard mapping
nnoremap Q <nop>                " Prevent Ex mode
nnoremap <Space> :noh<return>   " Press <Space> to turn off
                                " highlighting
                                " and clear any message already
                                " displayed.



" Leader mapping
"
" example:
"   :map ,A  oanother line<Esc>
"
let mapleader = ","
" ,p
:map ,p :CtrlP<cr>

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Toggle invisible characters
nnoremap <leader>i :set list!<cr>
