
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

if not functions -q fisher
    echo "Fisher not found. Installing..."
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end
