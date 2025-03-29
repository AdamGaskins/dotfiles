if [[ $(uname) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

PATH=$PATH:~/bin

bindkey -s ^f "tmux-sessionizer\n"
EDITOR="nvim"
