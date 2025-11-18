{
  homebrew = {
    enable = true;

    taps = [ ];
    casks = [
      "orbstack"
      # "zed"
      "zen"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
