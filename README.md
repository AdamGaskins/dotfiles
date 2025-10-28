# Dotfiles

## Install

Install Brew on Mac
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

[ZSH + OhMyZsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
```
brew install zsh
chsh -s $(which zsh)
```
Install Zsh plugins:
* https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
* https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh

Other brew packages
```
brew install lsd
brew install stow
brew install jj
brew install zoxide
```

Install NVM:
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install 22
nvm use 22
```

Install Nerd Font (Cascadia Code): https://www.nerdfonts.com/font-downloads

Starship Prompt
```
curl -sS https://starship.rs/install.sh | sh
```

Neovim
```
# Mac
brew install bob
bob install nightly
bob use nightly
```

## Link

1. Clone to `~/.dotfiles`
2. Run `stow .`
