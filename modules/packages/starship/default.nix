{ ... }:
{
  flake.configs.starship = ./config;
  flake.shellInits.starship = "starship init fish";

  flake.modules.starship =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.starship ];
    };
}
