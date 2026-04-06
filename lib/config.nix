{ ... }:
{
  flake.modules.configs-wiring =
    {
      config,
      lib,
      user,
      flake,
      ...
    }:
    {
      system.activationScripts.postActivation.text = lib.mkAfter (
        lib.concatStringsSep "\n" (
          [
            ''XDG_CONFIG_HOME="''${XDG_CONFIG_HOME:-${config.users.users.${user}.home}/.config}"''
            ''sudo -u ${user} mkdir -p "$XDG_CONFIG_HOME"''
          ]
          ++ lib.mapAttrsToList (name: path: ''
            sudo -u ${user} mkdir -p "$(dirname "$XDG_CONFIG_HOME/${name}")"
            if [ -d "$XDG_CONFIG_HOME/${name}" ] && [ ! -L "$XDG_CONFIG_HOME/${name}" ]; then
              sudo -u ${user} rm -rf "$XDG_CONFIG_HOME/${name}"
            fi
            sudo -u ${user} ln -sfn "${path}" "$XDG_CONFIG_HOME/${name}"
          '') flake.configs
        )
      );
    };
}
