"===============================================================
"   Description: plugins.vim
"   Author: N-Shinoda
"   Last Modified: 2022-02-16
"===============================================================

call plug#begin('~/.local/share/nvim/plugged')
    " colorscheme
    Plug 'cocopon/iceberg.vim'
    " インデントを見やすくする
    Plug 'Yggdroot/indentLine'
    " 閉じ括弧を補完する
    Plug 'cohama/lexima.vim'
    " ステータスラインの表示内容を強化する
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    " ディレクトリをツリー表示する
    Plug 'scrooloose/nerdtree'
    " HTMLやXMLのタグを自動で閉じる
    Plug 'alvan/vim-closetag'
    " 差分を左端に表示する
    Plug 'airblade/vim-gitgutter'
    " vim上でgitを操作する
    Plug 'tpope/vim-fugitive'
    " シンタックスを上書きして無効化できるようにする
    Plug 'elzr/vim-json'
    " LSP
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

if filereadable(expand("~/.local/share/nvim/plugged/iceberg.vim/colors/iceberg.vim"))
    colorscheme iceberg
endif