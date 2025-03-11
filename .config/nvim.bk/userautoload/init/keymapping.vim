"===============================================================
"   Description: keymapping.vim
"   Author: N-Shinoda
"   Last Modified: 2022-08-22
"===============================================================

" 行頭・行末移動方向をキーの相対位置にあわせる
nnoremap 0 $
nnoremap 1 0

" BackSpaceとDelete
inoremap <C-u> <BS>
inoremap <C-y> <Del>

" 現在行の下に空行を入れる
inoremap <C-o> <ESC>o

" 挿入モード中の移動
" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>

" 前のタブへ移動するショートカット「gT」を「gr」に変更
nnoremap gr :tabprevious<CR>

" Terminal のインサートモードを抜けるコマンドをESCにマッピング
tnoremap <ESC> <C-\><C-n>
