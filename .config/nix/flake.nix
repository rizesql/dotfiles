{
  description = "Darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          nix.settings.experimental-features = "nix-command flakes";

          programs.fish = {
            enable = true;
            package = pkgs.fish;
          };
          programs.zsh.enable = true;

          programs.direnv = {
            package = pkgs.direnv;
            silent = false;
            loadInNixShell = true;
            direnvrcExtra = "";
            nix-direnv = {
              enable = true;
              package = pkgs.nix-direnv;
            };
          };

          system.configurationRevision = self.rev or self.dirtyRev or null;
          system.stateVersion = 4;
          nixpkgs.hostPlatform = "aarch64-darwin";
          security.pam.services.sudo_local.touchIdAuth = true;

          users.users.rizesql = {
            name = "rizesql";
            uid = 501;
            home = "/Users/rizesql";
            shell = pkgs.fish;
          };
          users.knownUsers = [ "rizesql" ];

          system.defaults = {
            dock.autohide = true;
            dock.mru-spaces = false;
            finder.AppleShowAllExtensions = true;
            finder.FXPreferredViewStyle = "clmv";
            screencapture.location = "~/Pictures/screenshots";
            loginwindow.LoginwindowText = "";
            screensaver.askForPasswordDelay = 10;
          };

          environment.systemPackages = [
            pkgs.atuin
            pkgs.bat
            pkgs.delta
            pkgs.direnv
            pkgs.eza
            pkgs.fd
            pkgs.fnm
            pkgs.fzf
            pkgs.gh
            pkgs.git
            pkgs.jq
            pkgs.just
            pkgs.lazygit
            pkgs.lazydocker
            pkgs.neovim
            pkgs.nixfmt-rfc-style
            pkgs.nil
            pkgs.ripgrep
            pkgs.starship
            pkgs.stow
            pkgs.tmux
            pkgs.vim
            pkgs.yazi
            pkgs.zoxide
            pkgs.lua-language-server
          ];

          environment.etc."pam.d/sudo_local".text = ''
            # Managed by Nix Darwin
            auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
            auth       sufficient     pam_tid.so
          '';

          homebrew = {
            enable = true;

            taps = [ ];
            brews = [
              "dotenvx/brew/dotenvx"
              "pam-reattach"
              "fisher"
            ];
            casks = [
              "ghostty"
              "orbstack"
              "visual-studio-code"
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
