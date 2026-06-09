# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{...}: {
  imports = [
    ./configuration.nix
    ../../modules/system/gaming.nix
    ../../modules/system/flatpak.nix
    ../../modules/system/stylix.nix
    ../../modules/system/services.nix
    ../../modules/system/niri.nix
    ../../modules/system/greetd.nix
    ../../modules/system/nautilus.nix
	../../modules/system/fonts.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
}
