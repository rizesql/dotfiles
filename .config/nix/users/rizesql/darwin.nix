{ pkgs, ... }:
{
  imports = [ ../../lib/fonts.nix ];

  environment.systemPackages = [
    pkgs.direnv
    pkgs.nixfmt-rfc-style
    pkgs.nixd

    pkgs.atuin
    pkgs.bat
    pkgs.delta
    pkgs.eza
    pkgs.fd
    pkgs.fnm
    pkgs.fzf
    pkgs.gh
    pkgs.git
    pkgs.jq
    pkgs.just
    pkgs.lazygit
    pkgs.neovim
    pkgs.ripgrep
    pkgs.starship
    pkgs.stow
    pkgs.tmux
    pkgs.vim
    pkgs.yazi
    pkgs.zoxide
    pkgs.zellij

    pkgs.ghostty-bin
    pkgs.discord
    pkgs.obsidian
    pkgs.pam-reattach
    pkgs.raycast
    pkgs.vscode
  ];

  fonts.packages = [
    pkgs.nerd-fonts.commit-mono
    pkgs.nerd-fonts.geist-mono
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.zed-mono
  ];

  homebrew = {
    enable = true;

    taps = [ ];
    casks = [
      "orbstack"
      "zed"
      "zen"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.2;
      orientation = "left";
      tilesize = 56;
      magnification = false;
      show-recents = false;
      minimize-to-application = true;
      expose-animation-duration = 0.1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      persistent-apps = [ ];
      mru-spaces = false;
    };

    finder = {
      ShowPathbar = true;
      ShowStatusBar = false;
      FXPreferredViewStyle = "Nlsv";
      FXDefaultSearchScope = "SCcf";
      AppleShowAllExtensions = true;
      ShowExternalHardDrivesOnDesktop = true;
      ShowHardDrivesOnDesktop = true;
      ShowMountedServersOnDesktop = true;
      ShowRemovableMediaOnDesktop = true;
      FXEnableExtensionChangeWarning = false;
    };

    NSGlobalDomain = {
      KeyRepeat = 2;
      InitialKeyRepeat = 25;
      AppleShowScrollBars = "WhenScrolling";
      "com.apple.swipescrolldirection" = true;
      AppleInterfaceStyleSwitchesAutomatically = false;
      AppleInterfaceStyle = "Dark";
      NSWindowShouldDragOnGesture = true;
      AppleShowAllFiles = true;
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = false;
      Dragging = false;
      FirstClickThreshold = 1;
      SecondClickThreshold = 1;
      ActuationStrength = 1;
      TrackpadThreeFingerTapGesture = 2;
    };

    loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };

    screencapture.location = "~/Pictures/screenshots";
  };

  users.users.rizesql = {
    home = "/Users/rizesql";
    shell = pkgs.fish;
  };
  system.primaryUser = "rizesql";

  security.pam.services.sudo_local.touchIdAuth = true;
  environment.etc."pam.d/sudo_local".text = ''
    # Managed by Nix Darwin
    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
    auth       sufficient     pam_tid.so
  '';
}
