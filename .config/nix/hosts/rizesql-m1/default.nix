{
  imports = [
    ../../system/fonts.nix
    ../../system/nix.nix
    ../../system/security.nix
    ../../system/shells.nix
    ../../users/rizesql/apps.nix
    ../../users/rizesql/packages.nix
    ../../users/rizesql/user.nix
    ../../users/rizesql/homebrew.nix
    ../../system/macos.nix
  ];

  system.stateVersion = 5;
}
