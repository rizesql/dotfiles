{ ... }:
{
  flake.modules.homebrew =
    { pkgs, lib, ... }:
    lib.mkIf pkgs.stdenv.isDarwin {
      homebrew = {
        enable = true;

        taps = [ ];
        brews = [ ];
        casks = [
          "orbstack"
          "zed"
          "zen"
        ];
        onActivation = {
          cleanup = "zap";
          autoUpdate = true;
          upgrade = true;
        };
      };
    };
}
