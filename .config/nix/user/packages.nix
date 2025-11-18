{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.nixfmt-rfc-style
    pkgs.nixd
    pkgs.direnv

    pkgs.atuin
    pkgs.bat
    pkgs.delta
    pkgs.eza
    pkgs.fd
    pkgs.fnm
    pkgs.fzf
    pkgs.gh
    pkgs.git
    pkgs.jq
    pkgs.just
    pkgs.lazygit
    pkgs.neovim
    pkgs.ripgrep
    pkgs.starship
    pkgs.stow
    pkgs.tmux
    pkgs.vim
    pkgs.yazi
    pkgs.zoxide
    pkgs.zellij
  ];
}
