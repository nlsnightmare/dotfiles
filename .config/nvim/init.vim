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
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'adelarsq/vim-matchit'

Plug 'diepm/vim-rest-console'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" looks like it's not needed
" Plug 'Shougo/deoplete-clangx' 

Plug 'Shougo/neoinclude.vim'
Plug 'rust-lang/rust.vim'
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/snippets/"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/snippets/']

let g:rustfmt_autosave = 0
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
set nohlsearch
let mapleader = "\<Space>"

set foldenable
set foldlevelstart=10
nnoremap Q <nop>
set foldmethod=indent

nnoremap =b gg=G``zz
nnoremap j gj
nnoremap k gk
nnoremap L $
nnoremap H ^
nnoremap <M-j> :move +1<CR>
vnoremap <M-j> :move '>+1<CR>gv
" '

nnoremap <M-k> :move -2<CR>
vnoremap <M-k> :move -2<CR>gv

nnoremap <tab> za
nnoremap <C-b> :Buffers<CR>
nnoremap <C-e> :Files<CR>
nnoremap <leader>S :Lines<CR>
nnoremap <leader>q :bd<cr>
nnoremap <leader>Q :bd!<cr>
nmap <leader>s :set nohlsearch<CR><Plug>(easymotion-sn)

nmap <leader><leader>sv :source $MYVIMRC<CR>
nmap <leader><leader>ev :e $MYVIMRC<CR> 
nmap <leader><leader>pi :PlugInstall<CR>
nmap <leader><leader>pc :PlugClean<CR>
nmap <leader><leader>es :vsp<CR>:UltiSnipsEdit<CR>
cabb W w


nnoremap <leader><leader>sz :vsp ~/.zshrc<CR>
nnoremap <leader><leader>ez :vsp ~/.zshrc<CR>

nnoremap <leader>n :lnext<cr>
nnoremap <leader>p :lprev<cr>
let g:EasyMotion_smartcase = 1



let g:fzf_layout = { 'down': '~40%' }

vnoremap L $
vnoremap H ^

inoremap kj <esc>



" Highlight last inserted text
nnoremap gV `[v`]
nnoremap <leader><space> :nohlsearch<CR>

autocmd FileType python setlocal completeopt-=preview
autocmd FileType rust setlocal completeopt-=preview

au BufNewFile,BufRead * if &ft == '' | set ft=sh | endif
au BufNewFile,BufRead ~/.config/i3/config set ft=i3config
set completeopt=menu,preview,noinsert


set nowrap

" use the system clipboard
set clipboard=unnamedplus

set notermguicolors
colorscheme wal
hi CursorLineNr guibg=#ff0000
let g:lightline = { 'colorscheme': 'wal' }

hi LineNr term=bold cterm=bold ctermfg=2 guifg=Red guibg=Red

let g:AutoPairsFlyMode = 0
set signcolumn=yes

call neomake#configure#automake('nrwi', 3000)
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-Wall', '-Iinclude', '-Wextra', '-Weverything', '-pedantic', '-Wno-sign-conversion' ,'-Wno-c++98-compat', '-Wnognu-designator'],
   \ }

let g:neomake_javascript_enabled_makers = ['eslint']


" Required for operations modifying multiple buffers like rename.
set hidden



let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'stable', 'rls'],
            \ 'python': ['/usr/bin/pyls'],
            \ 'cpp': ['/usr/bin/cquery', '--log-file=/tmp/cq.log', '--init={"cacheDirectory":"/tmp/cquery/"}'],
            \ 'typescript': ['/usr/bin/javascript-typescript-stdio'],
            \ 'vue': ['vls'],
            \ 'cs': ['/opt/omnisharp-roslyn/OmniSharp.exe', '-lsp']
            \ }

let g:LanguageClient_rootMarkers = {
    \ 'cs': ['.git', '*.csproj'],
\ }

let g:LanguageClient_loggingLevel = 'ERROR'
let g:LanguageClient_windowLogMessageLevel = 'Error'
let g:LanguageClient_hoverPreview='Always'
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_definition()<CR>

set updatetime=500
" autocmd CursorHold * if LanguageClient_runSync('LanguageClient#isAlive') | call LanguageClient#textDocument_hover() | endif 



" Tern JS
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#guess = 0


" Startify
let g:startify_bookmarks = [ 
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 'i': '~/.config/i3/config' },
            \ ]

let g:startify_commands = [
            \ {'U': [ 'Update Plugins', 'PlugUpdate' ]},
            \ ]

let g:startify_lists = [
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ ]


autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
