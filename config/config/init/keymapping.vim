"==================================================
"   Description: keymapping.vim
"   Author: n-shinoda
"   Last Modified: 2018-06-10
"==================================================

" scriptファイルの文字コードを指定
scriptencoding utf-8

" 行頭・行末移動方向をキーの相対位置にあわせる
nnoremap 0 $
nnoremap 1 0

" BackSpaceとDelete
inoremap <C-u> <BS>
inoremap <C-y> <Del>

" 現在行の下に空行を入れる
inoremap <C-o> <ESC>o

" 挿入モード中の移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" キーマッピング
" insertモードから抜ける
" inoremap <silent> jj <ESC>
" inoremap <silent> <C-j> j
" inoremap <silent> kk <ESC>
" inoremap <silent> <C-k> k

" 括弧の補完
" inoremap { {}<Left>
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap [<Enter> []<Left><CR><ESC><S-o>
" inoremap (<Enter> ()<Left><CR><ESC><S-o>