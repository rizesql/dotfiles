{
  homebrew = {
    enable = true;

    taps = [ ];
    brews = [
      "gpg"
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
