"==================================================
"   Description: init.vim
"   Author: n-shinoda
"   Last Modified: 2019-08-25
"==================================================

if !&compatible
    set nocompatible
endif

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

set runtimepath+=~/.vim/
runtime! /config/init/plugins_dein.vim
runtime! /config/init/keymapping.vim
runtime! /config/init/editor.vim
" runtime! /config/plugins-config/*.vim
