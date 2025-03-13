alias reload-zsh='source ~/.config/zsh/.zshrc'

alias air='~/bin/air'
alias infocmp="/opt/homebrew/opt/ncurses/bin/infocmp"
alias todo='git grep -l TODO | xargs -n1 git blame -f -n -w | grep TODO | sed "s/.\{9\}//" | sed "s/(.*)[[:space:]]*//"'

alias z="zed"
zx() {
  cd $1 && cd .. && zed $1 && cd $1
}
alias vs="code"

alias l="eza -l --icons --git -a"
alias ls="eza --icons --group-directories-first --color=always"
alias ll="eza --icons --group-directories-first -l"
alias lt="eza --tree --level=2 --icons --git"
alias g="goto"
alias grep='grep --color'
alias cwd="pwd"
alias cl='clear'

alias v="nvim"
alias brew='arch -arm64 /opt/homebrew/bin/brew'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias vcpkg="$HOME/vcpkg/vcpkg"

alias catx="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias cat="bat --style=numbers --color=always --line-range :500"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"

# --bind='enter:execute($EDITOR {+})' \
alias fdx="fd -H -E .git -t d | fzf --multi --height=80% --border=sharp \
--preview='tree -C {}' --preview-window='45%,border-sharp' \
--prompt='Dirs > ' \
--bind='del:execute(rm -ri {+})' \
--bind='ctrl-p:toggle-preview' \
--bind='ctrl-d:change-prompt(Dirs > )' \
--bind='ctrl-o:execute($EDITOR {+})' \
--bind='ctrl-d:+reload(fd -t d)' \
--bind='ctrl-d:+change-preview(tree -C {})' \
--bind='ctrl-d:+refresh-preview' \
--bind='ctrl-f:change-prompt(Files > )' \
--bind='ctrl-f:+reload(fd -t f)' \
--bind='ctrl-f:+change-preview(bat --style=numbers --color=always {})' \
--bind='ctrl-f:+refresh-preview' \
--bind='ctrl-a:select-all' \
--bind='ctrl-x:deselect-all' \
--header '
CMD-D to display directories | CMD-F to display files
CMD-A to select all | CMD-x to deselect all
ENTER to select | DEL to delete
CMD-O to open in your default editor
CMD-P to toggle preview
'"

alias cdx='cd "$(fdx)"'
alias md='mkdir -p -- "$1" && cd $_'

ssl() {
  eval `ssh-agent -s` && ssh-add ~/.ssh/$1
}

profzsh() {
  shell=${1-$SHELL}
  ZPROF=true $shell -i -c exit
}
