{ ... }:
{
  flake.modules.user =
    {
      pkgs,
      lib,
      user,
      ...
    }:
    {
      users.users.${user} = {
        home = if pkgs.stdenv.isDarwin then "/Users/${user}" else "/home/${user}";
        shell = pkgs.fish;
      }
      // lib.optionalAttrs pkgs.stdenv.isLinux {
        isNormalUser = true;
      };

      system = lib.mkIf pkgs.stdenv.isDarwin {
        primaryUser = user;
        stateVersion = 6;
      };
    };
}
