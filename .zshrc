export EDITOR="zed"

eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -f ~/.config/zsh/zinit.zsh ]] && source ~/.config/zsh/zinit.zsh

[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# cocoapods
export CP_HOME_DIR="$XDG_DATA_HOME"/cocoapods

# pnpm
export PNPM_HOME="/Users/rizesql/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# GO
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin

# Dotnet
export PATH=$HOME/.dotnet/tools:$PATH

# bun completions
[ -s "/Users/rizesql/.bun/_bun" ] && source "/Users/rizesql/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[[ -f ~/.config/zsh/autocomplete.zsh ]] && source ~/.config/zsh/autocomplete.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd)"

enable-fzf-tab
