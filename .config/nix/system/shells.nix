{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    package = pkgs.direnv;
  };

  programs.fish.enable = true;

  environment.shells = with pkgs; [
    bashInteractive
    fish
  ];
}
