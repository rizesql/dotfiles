{
  description = "Darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    berkeley-mono = {
      url = "path:./modules/shared/berkeley-mono";
      flake = false;
    };
  };

  outputs =
    inputs:
    let
      lib = import ./lib { inherit inputs; };
      system = "aarch64-darwin";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
      darwinConfigurations = {
        "rizesql-m1" = lib.mkDarwin {
          inherit system;
          hostname = "rizesql-m1";
          user = "rizesql";
          modules = [
            inputs.sops-nix.darwinModules.sops
          ];
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.nixpkgs-fmt
        ];
      };

      checks.${system}.default = pkgs.runCommand "fmt-check" { } ''
        ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt --check ${inputs.self}
        touch $out
      '';
    };
}
