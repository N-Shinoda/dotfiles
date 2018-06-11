"==================================================
"   Description: plugins.vim
"   Author: n-shinoda
"   Last Modified: 2018-06-10
"==================================================

" scriptファイルの文字コードを指定
scriptencoding utf-8

" neobundle settings {{{
if has('vim_starting')
    set nocompatible
    " neobundleをインストールしていない場合は自動インストール
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install neobundle..."
        " vimからコマンド呼び出ししているだけneobundle.vimのクローン
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
    " runtimepathの追加は必須
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#endの間に導入するプラグインを記載する
NeoBundleFetch 'Shougo/neobundle.vim'
" 一連のインターフェースを提供するプラグイン
NeoBundle 'Shougo/unite.vim'
" ステータスラインの表示内容が強化するプラグイン
NeoBundle 'itchyny/lightline.vim'
" コード補完
NeoBundle 'Shougo/neocomplete.vim'
" Python補完のプラグイン
NeoBundle 'davidhalter/jedi-vim'
" Git操作用プラグイン
NeoBundle 'tpope/vim-fugitive'
" Color Scheme Solarized Dark
NeoBundle 'altercation/vim-colors-solarized'
" Color Scheme molokai
" NeoBundle 'tomasr/molokai'
" Tabで補完
NeoBundle 'ervandew/supertab'
" VimFiler
NeoBundle 'Shougo/vimfiler.vim'
" VimShell
NeoBundle 'Shougo/vimshell.vim'
" vimproc
NeoBundle 'Shougo/vimproc.vim'
" ES6のシンタックスハイライト
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}
autocmd Bufread,BufNewFile *.es6 setfiletype javascript

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on
