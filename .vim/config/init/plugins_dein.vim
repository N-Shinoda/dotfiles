"==================================================
"   Description: plugins_dein.vim
"   Author: n-shinoda
"   Last Modified: 2018-06-12
"==================================================

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

