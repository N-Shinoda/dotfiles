"==================================================
"   Description: .vimrc設定
"   Author: n-shinoda
"   Last Modified: 2017-09-12
"   Version: 1.09
"==================================================

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

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on

" Jedi for python
"NeoBundleLazy "davidhalter/jedi-vim", {
"    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}

"if ! empty(neobundle#get("jedi-vim"))
"    let g:jedi#auto_initialization = 1
"    let g:jedi#auto_vim_configuration = 1

"    nnoremap [jedi] <Nop>
"    xnoremap [jedi] <Nop>
"    nmap <Leader>j [jedi]
"    xmap <Leader>j [jedi]

"    let g:jedi#completions_command = "<C-N>"
"    let g:jedi#goto_assignments_command = "[jedi]g"
"    let g:jedi#goto_definitions_command = "[jedi]d"
"    let g:jedi#documentation_command = "[jedi]K"
"    let g:jedi#rename_command = "[jedi]r"
"    let g:jedi#usages_command = "[jedi]n"
"    let g:jedi#popup_select_first = 0
"    let g:jedi#popup_on_dot = 0

autocmd FileType python setlocal completeopt-=preview

" for w/ neocomplete
"    if ! empty(neobundle#get("neocomplete.vim"))
"        autocmd FileType python setlocal omnifunc=jedi#completions
"        let g:jedi#completions_enabled = 0
"        let g:jedi#auto_vim_configuration = 0
"        if ! exists('g:neocomplete#force_omni_input_patterns')
"            let g:neocomplete#force_omni_input_patterns = {}
"        endif

"        let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"    endif
"endif

" for lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],[ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'LightlineModified',
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'fileencoding': 'LightlineFileencoding',
    \   'mode': 'LightlineMode'
    \ }
    \ }

function! LightlineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
    return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \  '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        return fugitive#head()
    else
        return ''
    endif
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" for SuperTab
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"
highlight Pmenu ctermfg=lightgray ctermbg=black
highlight PmenuSel ctermfg=magenta ctermbg=gray

" キーマッピング
" insertモードから抜ける
" inoremap <silent> jj <ESC>
" inoremap <silent> <C-j> j
" inoremap <silent> kk <ESC>
" inoremap <silent> <C-k> k

" 行頭・行末移動方向をキーの相対位置にあわせる
nnoremap 0 $
nnoremap 1 0

" BackSpaceとDelete
inoremap <C-u> <BS>
inoremap <C-y> <Del>

" 現在行の下に空行を入れる
inoremap <C-o> <ESC>o
" 挿入モード
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" 括弧の補完
inoremap { {}<Left>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" vi互換ではなくVimのデフォルト設定にする
set nocompatible

" シンタックスハイライト
syntax enable

" エンコード
set encoding=utf-8

" ステータスライン
set laststatus=2

" 256色使用
set t_Co=256

" 背景色に合わせた色を自動的に設定する
set background=dark
" set background=light

" カラースキーム
" colorscheme solarized
" colorscheme molokai

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
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

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

" xtermとscreen対応
set ttymouse=xterm2

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
