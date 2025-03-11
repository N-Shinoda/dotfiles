"===============================================================
"   Description: nerdtree-config.vim
"   Author: N-Shinoda
"   Last Modified: 2022-12-06
"===============================================================

" NERDTreeToggle
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" 表示幅
"let g:NERDTreeWinSize=50

" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1

" 隠しファイルを表示する
let g:NERDTreeShowHidden=1

" 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']

