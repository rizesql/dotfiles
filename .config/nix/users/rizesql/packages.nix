{ pkgs, ... }:
{
  environment.variables = {
    FLAKE = "$HOME/dotfiles/.config/nix";
  };

  environment.systemPackages = [
    pkgs.nixfmt-rfc-style
    pkgs.nixd
    pkgs.direnv

    pkgs.age
    pkgs.atuin
    pkgs.bat
    pkgs.bitwarden-cli
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
    pkgs.nh
    pkgs.orbstack
    pkgs.ripgrep
    pkgs.sops
    pkgs.starship
    pkgs.stow
    pkgs.television
    pkgs.vim
    pkgs.yazi
    pkgs.zoxide
    pkgs.zellij
  ];
}
