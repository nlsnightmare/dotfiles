set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'chrisbra/Colorizer'
Plugin 'itchyny/lightline.vim'


Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'

Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'zchee/deoplete-jedi'

Plugin 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plugin 'Shougo/deoplete-clangx'
Plugin 'Shougo/neoinclude.vim'

"-------------------------------
" RUST
"-------------------------------
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

let g:rustfmt_autosave = 1
let g:racer_cmd = "/home/archangel/.cargo/bin/racer"

autocmd FileType rust nmap <buffer> <leader>t :RustTest<CR>
autocmd FileType rust nmap <buffer> <leader>T :RustTest!<CR>
" autocmd FileType rust nmap <buffer> <leader>r :RustRun<CR>
autocmd FileType rust nmap <buffer> <leader>r :!cargo run<CR>
autocmd FileType rust nmap <buffer> <leader>f :RustFmt<CR>
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap gD <Plug>(rust-doc)

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'mattn/emmet-vim'
call vundle#end()


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'

let g:deoplete#sources#ternjs#timeout = 0

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

call deoplete#enable()

filetype on
syntax on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number relativenumber
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
nnoremap L $
nnoremap H ^

vnoremap L $
vnoremap H ^

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
autocmd FileType html set tabstop=2|set shiftwidth=2|set noexpandtab
set completeopt=menu,preview,noinsert


set nowrap

" use the system clipboard
set clipboard=unnamedplus

set notermguicolors
colorscheme wal
hi CursorLineNr guibg=#ff0000
let g:lightline = { 'colorscheme': 'wal' }


hi LineNr term=bold cterm=bold ctermfg=2 guifg=Red guibg=Red




" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



