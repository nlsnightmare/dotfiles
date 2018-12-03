set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'challenger-deep-theme/vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'tpope/vim-surround'
Plugin 'davidhalter/jedi-vim'
Plugin 'chrisbra/Colorizer'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" Plugin 'othree/vim-autocomplpop'
call vundle#end()

call deoplete#enable()
let g:deoplete#auto_complete_delay=50


filetype on
syntax on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set showcmd
" set cursorline

filetype indent on
set wildmode=list:longest,full
set wildmenu
set showmatch

set incsearch
set hlsearch


set foldenable
set foldlevelstart=10
nnoremap Q <nop>
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

autocmd FileType python setlocal completeopt-=preview
autocmd FileType rust setlocal completeopt-=preview
set completeopt=menu,preview,noinsert



" use the system clipboard
set clipboard=unnamedplus

set notermguicolors
colorscheme wal
:
" set termguicolors
" colorscheme challenger_deep
" 
" if &term =~ '256color'
" set t_ut=
" endif
hi CursorLineNr guibg=#ff0000

let g:racer_cmd = "/home/archangel/.cargo/bin/racer"

hi LineNr term=bold cterm=bold ctermfg=2 guifg=Red guibg=Red
