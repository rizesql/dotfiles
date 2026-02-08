{
  homebrew = {
    enable = true;

    taps = [ ];
    brews = [
      "gemini-cli"
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
