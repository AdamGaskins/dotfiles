# Dotfiles

## Install

Install Brew on Mac
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

[ZSH + OhMyZsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
```
apt install zsh # linux
brew install zsh # mac

chsh -s $(which zsh)
```

Install Nerd Font

Starship Prompt
```
curl -sS https://starship.rs/install.sh | sh
```

Neovim
```
# Mac
brew install neovim

# Linux
curl -LO https://github.com/neovim/neovim/releases/v0.10.0/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Add to .zshrc
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

## Link

1. Clone to `~/.dotfiles`
2. Run `stow .`
