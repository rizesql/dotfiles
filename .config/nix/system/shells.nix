{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    package = pkgs.direnv;
  };

  programs.fish.enable = true;
  # programs.fish.shellInit = ''
  #   # Nix
  #   if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
  #     source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
  #   end
  #   # End Nix
  # '';

  environment.shells = with pkgs; [
    bashInteractive
    fish
  ];

  imports = [
    {
      nixpkgs.overlays = [
        (_self: super: {
          fish = super.fish.overrideAttrs {
            doCheck = false;
          };
        })
      ];
    }
  ];
}
