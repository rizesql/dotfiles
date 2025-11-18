{
  description = "Darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    berkeley-mono = {
      url = "path:./modules/shared/berkeley-mono";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      overlays = [ ];
      mkSystem = import ./lib/mksystem.nix {
        inherit overlays nixpkgs inputs;
      };
    in
    {
      darwinConfigurations.rizesql-m1 = mkSystem "macbook-pro-m1" {
        system = "aarch64-darwin";
        user = "rizesql";
        darwin = true;
      };
    };
}
