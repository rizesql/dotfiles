{
  description = "Darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      services.nix-daemon.enable = true;
      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 4;
      nixpkgs.hostPlatform = "aarch64-darwin";
      security.pam.enableSudoTouchIdAuth = true;

      users.users.rizesql = {
        name = "rizesql";
        home = "/Users/rizesql";
      };
      # home-manager.backupFileExtension = "backup";
      nix.configureBuildUsers = true;
      nix.useDaemon = true;

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 10;
        # org.hammerspoon.Hammerspoon.MJConfigFile = "~/.config/hammerspoon/init.lua";
        #
        CustomUserPreferences = {
          "org.hammerspoon.Hammerspoon" = {
            # MJConfigFile = "~/dotfiles/.config/hammerspoon/init.lua";
            MJConfigDir = "~/.config/hammerspoon";
          };
        };
      };

      environment.systemPackages = [
        pkgs.bat
        pkgs.direnv
        pkgs.stow
        pkgs.tmux
        pkgs.vim
      ];

      homebrew = {
        enable = true;

        taps = [];
        brews = [
          "orbstack"
          # "stow"
        ];
        casks = [
          "hammerspoon"
          "visual-studio-code"
          "wezterm"
          "zed"
        ];
      };
    };
  in
  {
    darwinConfigurations."Rizescus-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    darwinPackages = self.darwinConfigurations."Rizescus-MacBook-Pro".pkgs;
  };
}
