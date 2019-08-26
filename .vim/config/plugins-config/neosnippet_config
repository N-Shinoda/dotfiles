"==================================================
"   Description: neosnippet_config.vim
"   Author: n-shinoda
"   Last Modified: 2018-06-29
"==================================================

" Ctrl+kにターゲットジャンプ割当
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

let g:deoplete#enable_at_startup = 1
" Tab補完の設定
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \   "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" set snippet file dir
let g:neosnippet#snippets_directory='.cache/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/,~/.cache/neosnippet'
