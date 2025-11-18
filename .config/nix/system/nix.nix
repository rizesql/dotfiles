{
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    use-xdg-base-directories = true
    keep-outputs = true
    keep-derivations = true
  '';
}
