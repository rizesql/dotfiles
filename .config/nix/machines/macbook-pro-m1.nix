{ pkgs, ... }:
{
  system.stateVersion = 5;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
    use-xdg-base-directories = true
    keep-outputs = true
    keep-derivations = true
  '';

  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
  };

  programs.zsh.enable = true;
  programs.zsh.shellInit = ''
    # Nix
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi
    # End Nix
  '';

  programs.fish.enable = true;
  programs.fish.shellInit = ''
    # Nix
    if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
      source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    end
    # End Nix
  '';

  environment.shells = with pkgs; [
    bashInteractive
    zsh
    fish
  ];
}
