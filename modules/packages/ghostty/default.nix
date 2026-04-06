{ ... }:
{
  flake.configs.ghostty = ./config;
  flake.modules.ghostty =
    { pkgs, lib, ... }:
    lib.mkIf pkgs.stdenv.isDarwin {
      environment.systemPackages = [ pkgs.ghostty-bin ];
    };
}
