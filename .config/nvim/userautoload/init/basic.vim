"===============================================================
"   Description: basic.vim
"   Author: N-Shinoda
"   Last Modified: 2022-11-27
"===============================================================

" エンコード
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" scriptファイルの文字コードを指定
scriptencoding utf-8

" ステータスライン
set laststatus=2

" オムニ補完
" setlocal omnifunc=syntaxcomplete#Complete

" 256色使用
" set t_Co=256

" 背景色に合わせた色を自動的に設定する
" set background=dark
" set background=light

" 改行コードの自動認識
set fileformats=unix

" スクロールする時に下が見えるようにする
set scrolloff=5

" .swapファイルを作らない
set noswapfile

" バックアップファイルを作らない、バックアップをしない
set nobackup
set nowritebackup

" バックスペースで各種消せるようにする
" set backspace=indent,eol,start

" ビープ音を消す
" set visualbell t_vb=
" set noerrorbells
" set belloff=all

" OSのクリップボードを使う
set clipboard+=unnamedplus

" 不可視文字を表示
set list
set listchars=tab:»-,trail:_,extends:»,precedes:«,nbsp:%,eol:↲

" 行番号を表示
set number

" 行の相対表示をやめる
set norelativenumber

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

" 検索をより賢く設定
set smartcase

" 検索結果をハイライト表示する
set hlsearch
" 検索時、大文字と小文字を無視
set ignorecase

" コマンド、検索パターンを10000個まで履歴に残す
set history=10000

" マウスモード有効
set mouse=a

" xtermとscreen対応（NeoVimでは削除されたので、読み込まないようにする）
" if !has('nvim')
"     set ttymouse=xterm2
" endif

" コマンドを画面最下部に表示する
set showcmd

" 画面上でタブ文字が占める幅
set tabstop=4

" 自動インデントでずれる幅
set shiftwidth=4

" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

" タブ入力を複数の空白入力に置き換え
set expandtab

" 新しいウィンドウを右に置く
set splitright

" スムーズにbuffer切り替えをする
set hidden

" カーソル行の背景色変更
set cursorline

" 改行時に前の行のインデントを継続する
" set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
" set smartindent

" True Colorを使用するため
set termguicolors

" 改行時自動コメントアウトを無効にする
au FileType * set fo-=c fo-=r fo-=o
" setlocal formatoptions-=r
" setlocal formatoptions-=o

" 挿入モードで縦棒カーソルを使う
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" inoremap <Esc> <Esc>

" ファイルを開いたときにタブ文字があったらスペースに変換
" autocmd BufNewFile,BufRead * set expandtab
" autocmd BufNewFile,BufRead * retab

" 編集中のファイルが'Makefile'ならnoexpandtabにする
let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif

" python3_host_prog
let g:python3_host_prog = '~/.asdf/installs/python/3.12.1/bin/python'

" neovimにtmuxバッファとシステムクリップボードの両方をレジスタとして使用させる
let g:clipboard = {
  \   'name': 'TmuxClipboard',
  \   'copy': {
  \      '*': ['tmux', 'load-buffer', '-w', '-'],
  \      '+': ['tmux', 'load-buffer', '-w', '-'],
  \   },
  \   'paste': {
  \      '*': ['tmux', 'save-buffer', '-'],
  \      '+': ['tmux', 'save-buffer', '-'],
  \   },
  \   'cache_enabled': 1,
  \ }
