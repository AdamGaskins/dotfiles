if [[ $(uname) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    #eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

PATH=$PATH:~/bin

export XDG_CONFIG_HOME="$HOME/.config"

EDITOR="nvim"
source ~/emsdk/emsdk_env.sh 2>/dev/null
