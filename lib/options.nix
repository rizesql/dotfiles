{ lib, ... }:
{
  options.flake.modules = lib.mkOption {
    type = lib.types.attrsOf lib.types.deferredModule;
    default = { };
    description = "Cross-platform system modules, keyed by feature name.";
  };

  options.flake.fishConfigs = lib.mkOption {
    type = lib.types.attrsOf lib.types.path;
    default = { };
    description = "Fish-only conf.d files (abbreviations, fish-specific hooks).";
  };

  options.flake.configs = lib.mkOption {
    type = lib.types.attrsOf lib.types.path;
    default = { };
    description = "Config directories to symlink into ~/.config.";
  };

  options.flake.env = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = { };
    description = "Environment variables, rendered by whichever shell is active.";
  };

  options.flake.path = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "Paths to prepend to PATH, rendered by whichever shell is active.";
  };

  options.flake.shellInits = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = { };
    description = ''
      Shell-agnostic tool inits. Each value is the base command —
      the shell wiring appends the shell name and evals the output.
      e.g. shellInits.starship = "starship init" becomes
      "starship init fish | source" in fish.
    '';
  };
}
