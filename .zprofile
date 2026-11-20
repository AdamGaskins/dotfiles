if [[ $(uname) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    #eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

PATH=$PATH:~/bin

export XDG_CONFIG_HOME="$HOME/.config"

EDITOR="nvim"
# Costs ~200ms/shell (shells out to python via `emsdk construct_env`) - rarely used, source manually when needed
# source ~/emsdk/emsdk_env.sh 2>/dev/null

# Created by `pipx` on 2026-08-20 04:29:19
export PATH="$PATH:/Users/adam/.local/bin"

# >>> Codex installer >>>
export PATH="/Users/adam/.local/bin:$PATH"
# <<< Codex installer <<<

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
