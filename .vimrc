set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'challenger-deep-theme/vim'

call vundle#end()

syntax on
set tabstop=4
set softtabstop=4
set expandtab
set number
set showcmd
set cursorline

filetype indent on
set wildmenu
set showmatch

set incsearch
set hlsearch


set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=indent

nnoremap j gj
nnoremap k gk
inoremap kj <esc>

" Eval .vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Eval .zshrc
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


" Highlight last inserted text
nnoremap gV `[v`]



nnoremap <leader><space> :nohlsearch<CR>

set termguicolors
" colorscheme challenger_deep
" 
" if &term =~ '256color'
    " set t_ut=
" endif

