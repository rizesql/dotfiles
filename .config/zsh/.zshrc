export EDITOR="zed"
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -f "$XDG_CONFIG_HOME"/zsh/zinit.zsh ]] && source "$XDG_CONFIG_HOME"/zsh/zinit.zsh

[[ -f "$XDG_CONFIG_HOME"/zsh/aliases.zsh ]] && source "$XDG_CONFIG_HOME"/zsh/aliases.zsh

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship.toml

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# cocoapods
export CP_HOME_DIR="$XDG_DATA_HOME"/cocoapods

# pnpm
export PNPM_HOME="/Users/rizesql/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# GO
export GOPATH="$XDG_DATA_HOME"/go
export GOROOT=/usr/local/go

# Fly
export FLY_CONFIG_DIR="$XDG_STATE_HOME"/fly

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# terminfo
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

# Dotnet
export PATH=$HOME/.dotnet/tools:$PATH
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
# NuGet
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

# bun completions
[ -s "/Users/rizesql/.bun/_bun" ] && source "/Users/rizesql/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[[ -f "$XDG_CONFIG_HOME"/zsh/autocomplete.zsh ]] && source "$XDG_CONFIG_HOME"/zsh/autocomplete.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd)"

enable-fzf-tab
