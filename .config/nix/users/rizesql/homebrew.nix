{
  homebrew = {
    enable = true;

    taps = [ ];
    brews = [
      # "gpg"
      # "pinentry-mac"
    ];
    casks = [
      "zed"
      "zen"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
