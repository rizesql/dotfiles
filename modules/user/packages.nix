{ ... }:
{
  flake.modules.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        # nix tooling
        pkgs.nixfmt
        pkgs.nixd

        # secrets
        pkgs.age
        pkgs.sops

        # shell tools
        pkgs.eza
        pkgs.fnm
        pkgs.jq
        pkgs.just
        pkgs.ripgrep

        # dev
        pkgs.gh
        pkgs.neovim
        pkgs.vim
      ];
    };
}
