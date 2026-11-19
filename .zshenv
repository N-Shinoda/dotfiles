#==================================================
#   Description: .zshenv
#   Author: n-shinoda
#   Last Modified: 2026-11-19
#==================================================

# ----------------------------------------
# PATH
# ----------------------------------------


# ----------------------------------------
# Environment variables
# ----------------------------------------

export LANG=ja_JP.UTF-8

# 全角記号などの表示の修正
export VTE_CJK_WIDTH=1

# WSLg
export LIBGL_ALWAYS_INDIRECT=0

# Editor(sudoedit)
export EDITOR=nvim

# XDG Base Directroy
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"

# Neovim
export PATH=$PATH:$HOME/.local/bin

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.config//nvm"

# Rust
source "$HOME/.cargo/env"

# Poetry
export PATH="$HOME/.local/bin:$PATH"

# vcpkg
export VCPKG_ROOT="$HOME/vcpkg"

# Temurin 25
export JAVA_HOME=/usr/lib/jvm/temurin-25-jdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"
