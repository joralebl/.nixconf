{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.niri.nixosModules.niri
  ];
  # programs.niri = {
  #   enable = false;
  #   package = pkgs.niri-stable;
  # };
}
