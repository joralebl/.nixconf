{
  pkgs,
  niri,
  ...
}: {
  nixpkgs.overlays = [niri.overlays.niri];
  programs.niri = {
    enable = false;
    package = pkgs.niri-stable;
  };
}
