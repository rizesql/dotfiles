if test -e /opt/homebrew/bin/brew
    eval $(/opt/homebrew/bin/brew shellenv)
end

# set -xg PATH $HOME/bin $PATH

set -gx EDITOR "nvim"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow'

starship init fish | source
direnv hook fish | source
zoxide init fish --cmd cd | source
atuin init fish | source
fzf --fish | source
fnm env --use-on-cd --shell fish | source

set fzf_preview_dir_cmd eza -1 --color=always

set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -gx NPM_CONFIG_INIT_MODULE "$XDG_CONFIG_HOME/npm/config/npm-init.js"
set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"
set -gx NPM_CONFIG_TMP "$XDG_RUNTIME_DIR/npm"

set -gx PNPM_HOME "$XDG_DATA_HOME/pnpm"
if not contains $PNPM_HOME $PATH
    set -gx PATH $PNPM_HOME $PATH
end
