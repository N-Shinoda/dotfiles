"==================================================
"   Description: editor.vim
"   Author: n-shinoda
"   Last Modified: 2018-06-10
"==================================================

" シンタックスハイライト
syntax enable

" エンコード
set encoding=utf-8

" scriptファイルの文字コードを指定
scriptencoding utf-8

" vi互換ではなくVimのデフォルト設定にする
" set nocompatible

" ステータスライン
set laststatus=2

" オムニ補完
setlocal omnifunc=syntaxcomplete#Complete

" 256色使用
set t_Co=256

" 背景色に合わせた色を自動的に設定する
set background=dark
" set background=light

" カラースキーム
colorscheme lucius
" colorscheme iceberg
" colorscheme solarized

" ファイルエンコード
set fileencoding=utf-8

" 改行コードの自動認識
set fileformats=unix

" スクロールする時に下が見えるようにする
set scrolloff=5

" .swapファイルを作らない
set noswapfile

" バックアップファイルを作らない
set nowritebackup

" バックップをしない
set nobackup

" バックスペースで各種消せるようにする
set backspace=indent,eol,start

" ビープ音を消す
set visualbell t_vb=
set noerrorbells

" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed

" 不可視文字を表示
set list
set listchars=tab:»-,trail:_,extends:»,precedes:«,nbsp:%,eol:↲

" 行番号を表示
set number

" 右下に表示される行・列の番号を表示する
set ruler

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>

" 対応括弧をハイライト表示する
set showmatch

" 対応括弧の表示秒数を3秒にする
set matchtime=3

" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap

" 入力されているテキストの最大数を無効にする
set textwidth=0

" インクリメンタルサーチを行う
set incsearch

" 検索結果をハイライト表示する
set hlsearch

" コマンド、検索パターンを10000個まで履歴に残す
set history=10000

" マウスモード有効
set mouse=a

" xtermとscreen対応（NeoVimでは削除されたので、読み込まないようにする）
if !has('nvim')
    set ttymouse=xterm2
endif

" コマンドを画面最下部に表示する
set showcmd

" タブ入力を複数の空白入力に置き換え
set expandtab

" 画面上でタブ文字が占める幅
set tabstop=4

" 自動インデントでずれる幅
set shiftwidth=4

" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
