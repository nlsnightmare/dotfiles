if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'dylanaraps/wal.vim'
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neoinclude.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/snippets/"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/snippets/']

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
set smartcase
set ignorecase
set wildmode=longest,list,longest:full
set wildmenu
set showmatch

set incsearch
set hlsearch

let mapleader = "\<Space>"

set foldenable
set foldlevelstart=10
nnoremap Q <nop>
set foldmethod=indent

nnoremap j gj
nnoremap k gk
nnoremap L $
nnoremap H ^

nnoremap <tab> za
nnoremap <C-b> :Buffers<CR>
nnoremap <C-e> :Files<CR>
nnoremap <leader>s :Lines<CR>
nnoremap <leader>q :bd<cr>
nnoremap <leader>Q :bd!<cr>

nnoremap <leader>l :SyntasticToggle<cr>
nnoremap <leader>n :lnext<cr>
nnoremap <leader>p :lprev<cr>



let g:fzf_layout = { 'down': '~40%' }

vnoremap L $
vnoremap H ^

inoremap kj <esc>


" Eval .vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Eval .zshrc
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>:nohlsearch<CR>


" Highlight last inserted text
nnoremap gV `[v`]
nnoremap <leader><space> :nohlsearch<CR>

autocmd FileType python setlocal completeopt-=preview
autocmd FileType rust setlocal completeopt-=preview
set completeopt=menu,preview,noinsert


set nowrap

" use the system clipboard
set clipboard=unnamedplus

set notermguicolors
colorscheme wal
hi CursorLineNr guibg=#ff0000
let g:lightline = { 'colorscheme': 'wal' }

hi LineNr term=bold cterm=bold ctermfg=2 guifg=Red guibg=Red




set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_signs=1

let g:syntastic_error_symbol = "✗"
highlight SyntasticErrorLine guifg=white guibg=red
