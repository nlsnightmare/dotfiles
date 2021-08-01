call plug#begin('~/.config/nvim/plugins')
Plug 'VundleVim/Vundle.vim'
Plug 'dylanaraps/wal.vim'
Plug 'chrisbra/Colorizer'
Plug 'mhinz/vim-startify'

" Vim Helpers
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'adelarsq/vim-matchit'
Plug 'junegunn/vim-easy-align'

" REST Client
Plug 'diepm/vim-rest-console'

" Fuzzy file matching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Preview markdown files
Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_browser='google-chrome-stable'
" let vim_markdown_preview_use_xdg_open=1
let vim_markdown_preview_toggle=1



" Add support for jsx
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
let g:vim_jsx_pretty_colorful_config = 1 " default 0


Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

source ~/.config/nvim/base.vim
source ~/.config/nvim/keys.vim
source ~/.config/nvim/base-completion.vim

" Startify
let g:startify_bookmarks = [ 
            \ { 'z': '~/.zshrc' },
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 'i': '~/.config/i3/config' },
            \ { 'b': '~/.config/bspwm/bspwmrc' },
            \ { 'x': '~/.Xresources' },
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
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0

colorscheme wal


" Add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" PHP, move to it's own file
autocmd FileType php setlocal commentstring=//\ %s
