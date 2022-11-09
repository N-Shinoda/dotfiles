#==================================================
#   Description: .zshrc
#   Author: n-shinoda
#   Last Modified: 2022-11-07
#==================================================

# 環境変数
export LANG=ja_JP.UTF-8

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

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
compinit -u

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' $path

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# プロンプト
# PROMPT="%{${fg[cyan]}%}[%n@%m]%{${reset_color}%} %~
# %# "

function left-prompt {
  name_t='179m%}'             # user name text color
  name_b='000m%}'             # user name background color
  path_t='255m%}'             # path text color
  path_b='031m%}'             # path background color
  arrow='245m%}'              # arrow color
  text_color='%{\e[38;5;'     # set text color
  back_color='%{\e[30;48;5;'  # set background color
  reset='%{\e[0m%}'           # reset
  sharp="\uE0B0"              # triangle

  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}> ${reset}"
}

PROMPT=`left-prompt`

# コマンドの実行ごとに改行
function precmd() {
  # Print a newline before the prompt, unless it's the'
  # first prompt in the process.
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
    NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
    echo ""
  fi
}

# gitブランチ名を色付きで表示させる
function rprompt-git-current-branch {
  local branch_name st branch_status

  branch='\ue0a0'
  color='%{\e[38;5;'  # 文字色を設定
  green='114m%}'
  red='001m%}'
  yellow='227m%}'
  blue='031m%}'
  reset='%{\e[0m%}'   # reset

  color='%{\e[38;5;'  # 文字色を設定
  green='114m%}'

  # ブランチマーク
  if [ ! -e ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi
    branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${color}${green}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${color}${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="${color}${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="${color}${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "${color}${red}${branch} !(no branch)${reset}"
    return
  else
    # 上記以外の状態の場合
    branch_status="${color}${blue}${branch}"
  fi

  # ブランチ名を色付きで表示する
  echo "${branch_status} $branch_name${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# vcs_info
# autoload -Uz vcs_info
# autoload -Uz add-zsh-hook

# zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
# zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

# function _update_vcs_info_msg() {
#  LANG=en_US.UTF-8 vcs_info
#  RPROMPT="${vcs_info_msg_0_}"
# }
# add-zsh-hook precmd _update_vcs_info_msg

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
alias la='ls -a'
alias ll='ls -la --time-style="+%Y-%m-%d %H:%M:%S"'
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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# for sudoedit
export EDITOR=nvim

# 環境変数XDG_CONFIG_HOMEの設定（NeoVim用）
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"

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
