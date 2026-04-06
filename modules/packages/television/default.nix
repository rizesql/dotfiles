{ ... }:
{
  flake.configs.television = ./config;
  flake.modules.television =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.television ];
    };
}
