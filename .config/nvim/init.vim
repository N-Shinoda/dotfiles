"===============================================================
"   Description: init.vim
"   Author: N-Shinoda
"   Last Modified: 2019-08-28
"===============================================================

if !&compatible
    set nocompatible
endif

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

"===============================================================
"   plugins_dein
"===============================================================

scriptencoding utf-8

" プラグインが実際にインストールされるディレクトリ
let g:rc_dir = expand('~/.vim/rc')
let s:dein_dir = expand('~/.cache/dein')
" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimがなければ、githubから落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    " execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイルを用意しておく
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールのものがあったらインストール
if dein#check_install()
    call dein#install()
endif

" DeinList
function! s:dein_list() abort
    echomsg '[dein] #: not sourced, x: not installed'
    for pair in items(dein#get())
        echomsg (!isdirectory(pair[1].path) ? 'x'
            \ : pair[1].sourced ? ' '
            \ : '#') pair[0]
    endfor
endfunction
command! DeinList call s:dein_list()

"===============================================================
"   keymapping
"===============================================================

" scriptファイルの文字コードを指定
scriptencoding utf-8

" 行頭・行末移動方向をキーの相対位置にあわせる
nnoremap 0 $
nnoremap 1 0

" BackSpaceとDelete
inoremap <C-u> <BS>
inoremap <C-y> <Del>

" 現在行の下に空行を入れる
inoremap <C-o> <ESC>o

" 挿入モード中の移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" NERDTreeToggle
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" 閉じタグを補完
" augroup MyXML
"   autocmd!
"   autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"   autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
"   autocmd Filetype ejs inoremap <buffer> </ </<C-x><C-o>
" augroup END

" insertモードから抜ける
" inoremap <silent> jj <ESC>
" inoremap <silent> <C-j> j
" inoremap <silent> kk <ESC>
" inoremap <silent> <C-k> k

" 括弧の補完
" inoremap { {}<Left>
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap [<Enter> []<Left><CR><ESC><S-o>
" inoremap (<Enter> ()<Left><CR><ESC><S-o>

"===============================================================
"   editor
"===============================================================

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
" colorscheme lucius
colorscheme iceberg
" colorscheme solarized
" colorscheme dracula
" colorscheme molokai
" colorscheme default
" colorscheme cobalt2

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

" 編集中のファイルが'Makefile'ならnoexpandtabにする
let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif

" 画面上でタブ文字が占める幅
set tabstop=4

" 自動インデントでずれる幅
set shiftwidth=4

" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

" 改行時に前の行のインデントを継続する
" set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
" set smartindent

" 挿入モードで縦棒カーソルを使う
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
inoremap <Esc> <Esc>
