SHELL_SESSIONS_DISABLE=1
if [[ -e "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi
export EDITOR="nvim"
. "/Users/adam/.local/share/bob/env/env.sh"

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"
