{ ... }:
{
  flake.env = {
    NH_FLAKE = "$HOME/.dotfiles";
  };

  flake.modules.nh =
    {
      pkgs,
      lib,
      user,
      config,
      ...
    }:
    {
      environment.systemPackages = [ pkgs.nh ];

      launchd.user.envVariables = lib.mkIf pkgs.stdenv.isDarwin {
        NH_FLAKE = "${config.users.users.${user}.home}/dotfiles";
      };

      environment.variables = lib.mkIf pkgs.stdenv.isLinux {
        NH_FLAKE = "${config.users.users.${user}.home}/dotfiles";
      };
    };
}
