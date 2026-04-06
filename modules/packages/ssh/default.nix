{ ... }:
{
  flake.modules.ssh =
    { user, config, ... }:
    {
      programs.ssh = {
        extraConfig = ''
          Host github.com-rizesql
            HostName github.com
            IgnoreUnknown AddKeysToAgent,UseKeychain
            AddKeysToAgent yes
            UseKeychain yes
            IdentityFile ${config.users.users.${user}.home}/git_rizesql
            IdentitiesOnly yes
            User git

          Host github.com-codestory
            HostName github.com
            IgnoreUnknown AddKeysToAgent,UseKeychain
            AddKeysToAgent yes
            UseKeychain yes
            IdentityFile ${config.users.users.${user}.home}/git_codestory
            IdentitiesOnly yes
            User git
        '';
      };
    };
}
