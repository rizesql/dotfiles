{ ... }:
{
  flake.configs.git = ./config;
  flake.modules.git =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.git
        pkgs.delta
      ];
    };
}
