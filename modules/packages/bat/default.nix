{ ... }:
{
  flake.configs.bat = ./config;
  flake.modules.bat =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.bat ];
    };
}
