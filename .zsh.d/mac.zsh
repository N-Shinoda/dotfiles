#==================================================
#   Description: .zshrc_mac
#   Author: n-shinoda
#   Last Modified: 2022-12-04
#==================================================

# 環境変数
typeset -U path PATH
path=(
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /Library/Apple/usr/bin
)

# エイリアス
alias ls='ls -G -F'
alias ll='ls -lTa'
# sdl2
alias -g sdl='cl++ -F/Library/Frameworks -framework SDL2'

# C で標準出力をクリップボードにコピーする
if which pbcopy >/dev/null 2>&1 ; then
  alias -g C='| pbcopy'
fi

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# ls command color
export CLICOLOR=1

# for nodejs
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# for clangd
export PATH="/usr/local/opt/llvm/bin:$PATH"

# For compilers to find LLVM you may need to set
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"