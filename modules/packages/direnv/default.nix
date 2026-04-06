{ ... }:
{
  flake.fishConfigs.direnv = ./direnv.fish;
  flake.modules.direnv =
    { pkgs, ... }:
    {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        package = pkgs.direnv;
      };
    };
}
