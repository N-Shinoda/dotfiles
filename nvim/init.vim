"==================================================
"   Description: init.vim
"   Author: n-shinoda
"   Last Modified: 2018-06-29
"==================================================

if !&compatible
    set nocompatible
endif

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

set runtimepath+=~/.vim/
runtime! /config/init/plugins_dein.vim
runtime! /config/init/keymapping.vim
runtime! /config/init/editor.vim
runtime! /config/plugins-config/*.vim
