{ pkgs, ... }:
{
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

    pkgs.discord
    pkgs.obsidian
    pkgs.pam-reattach
    pkgs.raycast
    pkgs.vscode

    pkgs.nerd-fonts.commit-mono
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.zed-mono
  ];

  homebrew = {
    enable = true;

    taps = [ ];
    casks = [
      "ghostty"
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
    dock.autohide = true;
    dock.mru-spaces = false;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv";
    screencapture.location = "~/Pictures/screenshots";
    loginwindow.LoginwindowText = "";
    screensaver.askForPasswordDelay = 10;
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
