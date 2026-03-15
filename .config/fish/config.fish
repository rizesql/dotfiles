# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

if not functions -q fisher
    echo "Fisher not found. Installing..."
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

set fish_greeting

if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
end

if set -q GHOSTTY_RESOURCES_DIR
    source $GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end

if status is-interactive
    if type -q zellij
        function zellij_tab_name_update_post --on-event fish_postexec
            if set -q ZELLIJ
                set -l cmd_line (string split " " -- $argv)
                set -l process_name $cmd_line[1]
                if test "$process_name" = "cd"
                    command nohup zellij action rename-tab (prompt_pwd) >/dev/null 2>&1
                end
            end
        end
    end
end

if test -e /opt/homebrew/bin/brew
    eval $(/opt/homebrew/bin/brew shellenv)
end

set -gx EDITOR "nvim"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx NIX_REMOTE "daemon"

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

echo (date +%s%N) >> /tmp/fish-init.log
