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

  outputs = inputs: {
    darwinConfigurations."rizesql-m1" = inputs.darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        inherit inputs;
        user = "rizesql";
      };
      modules = [
        ./hosts/macbook-pro-m1/default.nix
        { nixpkgs.config.allowUnfree = true; }
      ];
    };
  };
}
