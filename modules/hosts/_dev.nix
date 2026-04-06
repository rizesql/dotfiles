{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [ pkgs.nixfmt ];
      };

      checks.fmt = pkgs.runCommand "fmt-check" { } ''
        ${pkgs.nixfmt}/bin/nixfmt --check ${../..}
        touch $out
      '';

      formatter = pkgs.nixfmt-tree;
    };
}
