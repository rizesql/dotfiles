{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.ghostty-bin
    pkgs.discord
    pkgs.obsidian
    pkgs.pam-reattach
    pkgs.raycast
    pkgs.vscode
  ];
}
