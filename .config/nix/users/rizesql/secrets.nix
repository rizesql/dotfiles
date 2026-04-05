{ ... }:
{
  sops = {
    age.keyFile = "/Users/rizesql/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;

    secrets = {
      "git_rizesql" = {
        owner = "rizesql";
        path = "/Users/rizesql/.ssh/git_rizesql";
        mode = "0400";
      };
      "git_codestory" = {
        owner = "rizesql";
        path = "/Users/rizesql/.ssh/git_codestory";
        mode = "0400";
      };
    };
  };
}
