{
  inputs,
  config,
  lib,
  ...
}:
{
  flake.darwinConfigurations."rizesql-m1" = inputs.nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = {
      inherit inputs;
      flake = config.flake;
      hostname = "rizesql-m1";
      user = "rizesql";

      networking = {
        hostName = "rizesql-m1";
        computerName = "rizesql-m1";
      };
    };
    modules = lib.attrValues config.flake.modules ++ [
      inputs.sops-nix.darwinModules.sops
      { nixpkgs.config.allowUnfree = true; }
    ];
  };
}
