#==================================================
#   Description: .zshrc_linux
#   Author: n-shinoda
#   Last Modified: 2022-12-04
#==================================================

# エイリアス
alias ls='ls -F --color=auto'
alias ll='ls -la --time-style="+%Y-%m-%d %H:%M:%S"'

# グローバルエイリアス
alias -g sdl="clang++ -I/usr/local/include/SDL2 -D_THREAD_SAFE -L/usr/local/lib -lSDL2"

# C で標準出力をクリップボードにコピーする
if which xsel >/dev/null 2>&1 ; then
  alias -g pbcopy='| xsel --clipboard --input'
fi

# rmコマンドでゴミ箱へ移動するようにする
# if type trash-put &> /dev/null
# then
#     alias rm=trash-put
# fi

# 環境変数DISPLAYの設定
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# resolve.confを上書きしている場合
# export DISPLAY=$(route | grep default | awk '{print $2}'):0

# for asdf
. $HOME/.asdf/asdf.sh
# fpathに補完を追加する
fpath=(${ASDF_DIR}/completions $fpath)

# 全角記号などの表示の修正
export VTE_CJK_WIDTH=1

# WSLg
export LIBGL_ALWAYS_INDIRECT=0

# tmux
export TERM=screen-256color
