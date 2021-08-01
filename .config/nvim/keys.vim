let mapleader = "\<Space>"
nnoremap Q <nop>
nnoremap =b gg=G``zz
nnoremap j gj
nnoremap k gk
vnoremap L $
vnoremap H ^
inoremap jj <esc>
"
" Highlight last inserted text
nnoremap gV `[v`]
nnoremap <leader><space> :nohlsearch<CR>

nnoremap L $
nnoremap H ^
nnoremap <M-j> :move +1<CR>
vnoremap <M-j> :move '>+1<CR>gv

nnoremap <M-k> :move -2<CR>
vnoremap <M-k> :move -2<CR>gv

nnoremap <tab> za
nnoremap <C-b> :Buffers<CR>
nnoremap <C-e> :Files<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>q :bd<cr>
nnoremap <leader>Q :bd!<cr>
nmap <leader>s :set nohlsearch<CR><Plug>(easymotion-sn)

nmap <leader><leader>sv :source $MYVIMRC<CR>
nmap <leader><leader>ev :e $MYVIMRC<CR> 
nmap <leader><leader>pi :PlugInstall<CR>
nmap <leader><leader>pc :PlugClean<CR>
nmap <leader><leader>pu :PlugUpdate<CR>
nmap <leader><leader>pU :PlugUpgrade<CR>
nmap <leader><leader>es :vsp<CR>:UltiSnipsEdit<CR>
cabb W w


nnoremap <leader><leader>sz :!source ~/.zshrc<CR>
nnoremap <leader><leader>ez :vsp ~/.zshrc<CR>

nnoremap <leader>n :lnext<cr>
nnoremap <leader>p :lprev<cr>


nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>a
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz
