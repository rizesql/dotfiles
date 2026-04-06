{ ... }:
{
  flake.configs.lazygit = ./config;
  flake.modules.lazygit =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.lazygit ];
    };
}
