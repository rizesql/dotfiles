{ ... }:
{
  flake.shellInits.fzf = "fzf --fish";
  flake.env = {
    FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow";
  };

  flake.modules.fzf =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.fzf
        pkgs.fd
      ];
    };
}
