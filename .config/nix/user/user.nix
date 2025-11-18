{ pkgs, ... }:
{
  users.users.rizesql = {
    home = "/Users/rizesql";
    shell = pkgs.fish;
  };
  system.primaryUser = "rizesql";
}
