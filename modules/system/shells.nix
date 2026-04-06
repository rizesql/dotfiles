{ ... }:
{
  flake.modules.shells =
    { pkgs, ... }:
    {
      # programs.direnv = {
      #   enable = true;
      #   nix-direnv.enable = true;
      #   package = pkgs.direnv;
      # };

      environment.shells = with pkgs; [
        bashInteractive
        fish
      ];
    };
}
