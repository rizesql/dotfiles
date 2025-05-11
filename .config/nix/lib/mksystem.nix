{
  nixpkgs,
  overlays,
  inputs,
}:

name:
{
  system,
  user,
  darwin ? false,
}:

let
  machineConfig = ../machines/${name}.nix;
  userOSConfig = ../users/${user}/${if darwin then "darwin" else "nixos"}.nix;

  systemFunc = if darwin then inputs.darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
in
systemFunc rec {
  inherit system;

  modules = [
    { nixpkgs.overlays = overlays; }
    { nixpkgs.config.allowUnfree = true; }
    machineConfig
    userOSConfig
    {
      config._module.args = {
        currentSystem = system;
        currentSystemName = name;
        currentSystemUser = user;
        inputs = inputs;
        isWSL = false;
      };
    }
  ];
}
