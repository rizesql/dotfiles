{ inputs }:

{
  mkDarwin =
    {
      system,
      hostname,
      user,
      modules,
    }:
    inputs.darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {
        inherit inputs hostname user;
      };
      modules = modules ++ [
        ../hosts/${hostname}/default.nix
        { nixpkgs.config.allowUnfree = true; }
      ];
    };
}
