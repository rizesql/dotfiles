{ pkgs, ... }:
{
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
    pkgs.neovim
    pkgs.nixfmt-rfc-style
    pkgs.nixd
    pkgs.ripgrep
    pkgs.starship
    pkgs.stow
    pkgs.tmux
    pkgs.vim
    pkgs.yazi
    pkgs.zoxide
  ];

  homebrew = {
    enable = true;

    taps = [ ];
    brews = [
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

  security.pam.services.sudo_local.touchIdAuth = true;
  environment.etc."pam.d/sudo_local".text = ''
    # Managed by Nix Darwin
    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
    auth       sufficient     pam_tid.so
  '';
}
