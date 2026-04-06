{ ... }:
{
  flake.configs.yazi = ./config;
  flake.modules.yazi =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.yazi ];
    };
}
