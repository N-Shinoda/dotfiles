#==================================================
#   Description: .zshrc
#   Author: n-shinoda
#   Last Modified: 2022-11-15
#==================================================

# 環境変数
export LANG=ja_JP.UTF-8

# キーバインド
# emacs 風キーバインドにする
bindkey -e

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# HOMEキーとENDキーを機能させる
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

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

# 色を使用出来るようにする
autoload -Uz colors
colors

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完機能を有効にする
fpath=(~/.zsh.d/completion $fpath)

autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' $path

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# # vcs_info
# autoload -Uz vcs_info
# autoload -Uz add-zsh-hook

# zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
# zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

# function _update_vcs_info_msg() {
#   LANG=en_US.UTF-8 vcs_info
#   RPROMPT="${vcs_info_msg_0_}"
# }
# add-zsh-hook precmd _update_vcs_info_msg

# PROMPT
setopt prompt_subst # プロンプト表示

precmd() {
  if [ -n "$(git status --short 2>/dev/null)" ]; then
    export GIT_HAS_DIFF="✗"
    export GIT_NON_DIFF=""
  else
    export GIT_HAS_DIFF=""
    export GIT_NON_DIFF="✔"
  fi
  # git管理されているか確認
  git status --porcelain >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    export GIT_HAS_DIFF=""
    export GIT_NON_DIFF=""
  fi
  export BRANCH_NAME=$(git branch --show-current 2>/dev/null)
}

# 末尾に空白をつけることで改行される
PROMPT="
%{${fg[yellow]}%}[%n@%m]%{${reset_color}%} %~"
PROMPT=${PROMPT}'%F{green}  ${BRANCH_NAME} ${GIT_NON_DIFF}%F{red}${GIT_HAS_DIFF}
%f$ '

# PROMPT="%{${fg[yellow]}%}[%n@%m]%{${reset_color}%} %~
# %# "

# エイリアス
alias la='ls -a'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ../'
alias mkdir='mkdir -p'
alias rm='rm -i'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# ssh to aurora-sv.local as gitadmin.
# alias ssh2gitadmin='ssh -i ~/.ssh/gitadmin_id_rsa -p 54322 gitadmin@192.168.11.30'

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
alias -g cl++='clang++ -std=c++17 -Wall --pedantic-errors'

# シェルの再起動
alias relogin='exec $SHELL -l'

# Ctrl + s
stty stop undef

# for sudoedit
export EDITOR=nvim

# 環境変数XDG_CONFIG_HOMEの設定
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"

# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# OS別の設定
case ${OSTYPE} in
  darwin*)
    #Mac用の設定
    source "$HOME/.zsh.d/.zshrc_mac"
    ;;
  linux*)
    #Linux用の設定
    source "$HOME/.zsh.d/.zshrc_linux"
    ;;
esac

# vim:set ft=zsh:

# for profiling
if (which zprof > /dev/null 2>&1) ;then
    zprof
fi
