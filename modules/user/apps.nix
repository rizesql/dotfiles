{ ... }:
{
  flake.modules.apps =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = [
        pkgs.discord
        pkgs.obsidian
        pkgs.vscode
      ]
      ++ lib.optionals pkgs.stdenv.isDarwin [
        pkgs.pam-reattach
        pkgs.raycast
      ];
    };
}
