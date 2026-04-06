{ ... }:
{
  flake.configs.zellij = ./config;
  flake.modules.zellij =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.zellij ];
    };
}
