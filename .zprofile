#==================================================
#   Description: .zprofile
#   Author: n-shinoda
#   Last Modified: 2026-11-19
#==================================================

# User local binaries
if [[ -d "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# User binaries
if [[ -d "$HOME/bin" ]]; then
    export PATH="$HOME/bin:$PATH"
fi