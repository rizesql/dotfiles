# OrbStack integration (runtime-generated, must stay conditional)
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

if not functions -q fisher
    echo "Fisher not found. Installing..."
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# Ghostty shell integration
if set -q GHOSTTY_RESOURCES_DIR
    source $GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end

set fish_greeting
