export EDITOR="nvim"

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_RUNTIME_DIR=/run/user/$UID

eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -f "$XDG_CONFIG_HOME"/zsh/zinit.zsh ]] && source "$XDG_CONFIG_HOME"/zsh/zinit.zsh

# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship.toml
eval "$(starship init zsh)"

export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ZSH_EVALCACHE_DIR="$XDG_CACHE_HOME"/zsh/evalcache
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# cocoapods
export CP_HOME_DIR="$XDG_DATA_HOME"/cocoapods

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

export PATH=$PATH:"$XDG_DATA_HOME"/cargo/bin
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
# export PATH="$XDG_DATA_HOME/npm/bin:$PATH"

# terminfo
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

[[ -f "$XDG_CONFIG_HOME"/zsh/autocomplete.zsh ]] && source "$XDG_CONFIG_HOME"/zsh/autocomplete.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zsh-defer _evalcache direnv hook zsh
zsh-defer _evalcache fzf --zsh
zsh-defer _evalcache zoxide init --cmd cd zsh
zsh-defer _evalcache fnm env --use-on-cd
zsh-defer _evalcache atuin init zsh

[[ -f "$XDG_CONFIG_HOME"/zsh/aliases.zsh ]] && source "$XDG_CONFIG_HOME"/zsh/aliases.zsh

enable-fzf-tab

# bun completions
[ -s "/Users/rizesql/.bun/_bun" ] && source "/Users/rizesql/.bun/_bun"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
# export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
# export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
# export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export FLY_CONFIG_DIR="$XDG_STATE_HOME"/fly

export PATH="$XDG_CACHE_HOME"/.bun/bin:$PATH

# pnpm
# export PNPM_HOME="/Users/rizesql/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end
