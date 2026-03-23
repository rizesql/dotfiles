{ ... }:
{
  sops = {
    age.keyFile = "/Users/rizesql/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;
  };

  secrets."git_rizesql_ssh" = {
    owner = "rizesql";
    path = "/Users/rizesql/.ssh/git_rizesql";
    mode = "0400"; # SSH keys must have strict permissions
  };
}
