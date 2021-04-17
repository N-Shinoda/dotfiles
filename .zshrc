#==================================================
#   Description: .zshrc
#   Author: n-shinoda
#   Last Modified: 2020-11-17
#==================================================

# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[yellow]}%}[%n@%m]%{${reset_color}%} %~
%# "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# zsh: no matches found:
setopt nonomatch

# キーバインド
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# HOMEキーとENDキーを機能させる
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# エイリアス
# eval `dircolors ~/.colorrc`
alias ls='ls -F --color=auto'
alias la='ls -a'
# alias ll='ls -la'
alias ll='ls -la --time-style="+%Y-%m-%d %H:%M:%S"'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ../'
alias mkdir='mkdir -p'

# rmコマンドでゴミ箱へ移動する
#if type trash-put &> /dev/null
#then
#    alias rm=trash-put
#fi

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# ssh to aurora-sv.local as gitadmin.
# alias ssh2gitadmin='ssh -i ~/.ssh/gitadmin_id_rsa -p 54322 gitadmin@192.168.11.30'

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

alias -g cl++='clang++'
alias -g cl="clang"
alias -g sdl="clang++ -I/usr/local/include/SDL2 -D_THREAD_SAFE -L/usr/local/lib -lSDL2"

# C で標準出力をクリップボードにコピーする
if which xsel >/dev/null 2>&1 ; then
    alias -g C='| xsel --input --clipboard'
fi

# シェルの再起動
alias relogin='exec $SHELL -l'

# Ctrl + s
stty stop undef

# vim:set ft=zsh:

# 環境変数DISPLAYの設定
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# resolve.confを上書きいしている場合
export DISPLAY=$(route | grep default | awk '{print $2}'):0

# 必ずXming経由でOpenGLを使う
export LIBGL_ALWAYS_INDIRECT=1

# 全角記号などの表示の修正
export VTE_CJK_WIDTH=1

# 環境変数XDG_CONFIG_HOMEの設定（NeoVim用）
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init -)"

# for sudoedit
export EDITOR=nvim

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

