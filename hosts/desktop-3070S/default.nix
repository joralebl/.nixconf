# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{inputs, ...}: {
  imports = [
    ./configuration.nix
    ../../modules/system/gaming.nix
    ../../modules/system/flatpak.nix
    ../../modules/system/stylix.nix
    ../../modules/system/services.nix
    # ../../modules/system/xdg.nix
    # ../../modules/system/plasma.nix
    ../../modules/system/niri.nix
    ../../modules/system/greetd.nix
    ../../modules/system/thunar.nix
    # ../../modules/system/ly.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
}
