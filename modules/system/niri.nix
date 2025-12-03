{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];
  programs.niri.enable = true;
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri.package = pkgs.niri-unstable;
}
