{ ... }:
{
  flake.configs.fish = ./config;
  flake.modules.fish =
    {
      pkgs,
      config,
      user,
      lib,
      ...
    }:
    {
      programs.fish = {
        enable = true;
      };

      system.activationScripts = {
        fishCache.text = ''
          rm -rf ${config.users.users.${user}.home}/.cache/fish
        '';

        fishEnv.text =
          let
            content = lib.concatStringsSep "\n" (
              lib.mapAttrsToList (k: v: "set -gx ${k} \"${v}\"") config.flake.env
            );
            file = pkgs.writeText "nix-env.fish" content;
          in
          ''
            sudo -u ${user} mkdir -p "${config.users.users.${user}.home}/.config/fish/conf.d"
            sudo -u ${user} ln -sfn "${file}" "${
              config.users.users.${user}.home
            }/.config/fish/conf.d/nix-env.fish"
          '';

        fishPath.text =
          let
            content = lib.concatStringsSep "\n" (map (p: "fish_add_path ${p}") config.flake.path);
            file = pkgs.writeText "nix-path.fish" content;
          in
          ''
            sudo -u ${user} mkdir -p "${config.users.users.${user}.home}/.config/fish/conf.d"
            sudo -u ${user} ln -sfn "${file}" "${
              config.users.users.${user}.home
            }/.config/fish/conf.d/nix-path.fish"
          '';

        fishInits.text =
          let
            content = lib.concatStringsSep "\n" (
              lib.mapAttrsToList (name: cmd: ''
                set -l __cache "$XDG_CACHE_HOME/fish/${name}.fish"
                if not test -f $__cache
                    mkdir -p (dirname $__cache)
                    ${cmd} > $__cache
                end
                source $__cache
              '') config.flake.shellInits
            );
            file = pkgs.writeText "nix-inits.fish" content;
          in
          ''
            sudo -u ${user} mkdir -p "${config.users.users.${user}.home}/.config/fish/conf.d"
            sudo -u ${user} ln -sfn "${file}" "${
              config.users.users.${user}.home
            }/.config/fish/conf.d/nix-inits.fish"
          '';

        fishConfd.text =
          ''sudo -u ${user} mkdir -p "${config.users.users.${user}.home}/.config/fish/conf.d"''
          + "\n"
          + lib.concatStringsSep "\n" (
            lib.mapAttrsToList (name: path: ''
              sudo -u ${user} ln -sfn "${path}" "${
                config.users.users.${user}.home
              }/.config/fish/conf.d/${name}.fish"
            '') config.flake.fishConfigs
          );
      };
    };
}
