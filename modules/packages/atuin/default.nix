{ ... }:
{
  flake.configs.atuin = ./config;
  flake.shellInits.atuin = "atuin init fish";

  flake.modules.atuin =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.atuin ];
    };
}
