"===============================================================
"   Description: vim-airline-config.vim
"   Author: N-Shinoda
"   Last Modified: 2022-02-16
"===============================================================

set laststatus=2
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 1
nnoremap <C-p> <Plug>AirlineSelectPrevTab
nnoremap <C-n> <Plug>AirlineSelectNextTab
