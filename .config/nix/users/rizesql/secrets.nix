{ ... }:
{
  sops = {
    age.keyFile = "/Users/rizesql/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;

    secrets = {
      "git_rizesql_ssh_key" = {
        owner = "rizesql";
        path = "/Users/rizesql/.ssh/git_rizesql_ssh_key";
        mode = "0400";
      };
      "git_codestory_ssh_key" = {
        owner = "rizesql";
        path = "/Users/rizesql/.ssh/git_codestory_ssh_key";
        mode = "0400";
      };
      "codestory" = {
        owner = "rizesql";
        path = "/Users/rizesql/.ssh/codestory";
        mode = "0400";
      };
    };
  };
}
