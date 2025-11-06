# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  host,
  ...
}: {
  system.stateVersion = "24.05";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  imports = [
    ../../nixosModules/system.nix
    ../../nixosModules/gaming.nix
    ../../nixosModules/flatpak.nix
    ../../nixosModules/stylix.nix
    ../../nixosModules/services.nix
    ../../nixosModules/plasma.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  #bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
  };

  zramSwap.enable = true;

  networking.hostName = "${host}"; # Define your hostname.

  networking.networkmanager.enable = true;

  fileSystems."/home/jordanl/Store" = {
    device = "/dev/disk/by-uuid/f0e41fd2-331a-4265-8938-b1f3bb4b4da8";
    fsType = "btrfs";
    options = ["defaults"];
  };

  fileSystems."/home/jordanl/Extra" = {
    device = "/dev/disk/by-uuid/b93b2fa6-4a76-4cd7-85f9-fd035d2f11a4";
    fsType = "ext4";
    options = ["defaults"];
  };

  #for Nvidia GPU
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    videoAcceleration = true;
    #forceFullCompositionPipeline = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
