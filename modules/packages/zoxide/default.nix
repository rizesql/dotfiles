{ ... }:
{
  flake.shellInits.zoxide = "zoxide init fish --cmd cd";

  flake.modules.zoxide =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.zoxide ];
    };
}
