{ ... }:
{
  flake.modules.shells =
    { pkgs, ... }:
    {
      environment.shells = with pkgs; [
        bashInteractive
        fish
      ];
    };
}
