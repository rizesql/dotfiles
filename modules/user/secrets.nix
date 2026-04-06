{ ... }:
{
  flake.modules.secrets =
    { user, config, ... }:
    {
      sops = {
        age.keyFile = "${config.users.users.${user}.home}/.config/sops/age/keys.txt";
        defaultSopsFile = ../../secrets/secrets.yaml;

        secrets = {
          "git_rizesql" = {
            owner = user;
            path = "${config.users.users.${user}.home}/.ssh/git_rizesql";
            mode = "0400";
          };
          "git_codestory" = {
            owner = user;
            path = "${config.users.users.${user}.home}/.ssh/git_codestory";
            mode = "0400";
          };
        };
      };
    };
}
