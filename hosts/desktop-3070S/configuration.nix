{
  config,
  pkgs,
  inputs,
  lib,
  username,
  host,
  ...
}: {
  system.stateVersion = "24.05";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.blacklistedKernelModules = ["nouveau" "nova_core"];

  programs.zsh.enable = true;
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };
  zramSwap.enable = true;

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Moncton";
  i18n.defaultLocale = "en_CA.UTF-8";

  services.printing = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    lua
    ffmpeg
    pkg-config
    curl
    xsel
    ncdu
    fastfetchMinimal
    eza
    bat
    mcfly
    fd
    ripgrep
    gnumake
    cargo
    rebar3
    taskwarrior3
    silver-searcher
    pwvucontrol
    unrar
    unzip
    # ~~~~Niri
    wl-clipboard
    networkmanagerapplet
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  programs.starship = {
    enable = true;
    presets = [
      "pure-preset"
    ];
  };
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      gccStdenv.cc.cc
    ];
  };
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
    extraConfig.pipewire = {
      "99-disable-bell" = {
        "context.properties" = {
          "module.x11.bell" = false;
        };
      };
    };
  };

  #bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
  };
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
    # // {
    #   open = config.boot.kernelPackages.nvidiaPackages.stable.open.overrideAttrs (old: {
    #     patches =
    #       (old.patches or [])
    #       ++ [
    #         (pkgs.fetchpatch {
    #           name = "get_dev_pagemap.patch";
    #           url = "https://github.com/NVIDIA/open-gpu-kernel-modules/commit/3e230516034d29e84ca023fe95e284af5cd5a065.patch";
    #           hash = "sha256-BhL4mtuY5W+eLofwhHVnZnVf0msDj7XBxskZi8e6/k8=";
    #         })
    #       ];
    #   });
    # };
    # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #   version = "580.95.05";
    #   sha256_64bit = "sha256-hJ7w746EK5gGss3p8RwTA9VPGpp2lGfk5dlhsv4Rgqc=";
    #   sha256_aarch64 = "sha256-zLRCbpiik2fGDa+d80wqV3ZV1U1b4lRjzNQJsLLlICk=";
    #   openSha256 = "sha256-RFwDGQOi9jVngVONCOB5m/IYKZIeGEle7h0+0yGnBEI=";
    #   settingsSha256 = "sha256-F2wmUEaRrpR1Vz0TQSwVK4Fv13f3J9NJLtBe4UP2f14=";
    #   persistencedSha256 = "sha256-QCwxXQfG/Pa7jSTBB0xD3lsIofcerAWWAHKvWjWGQtg=";
    # };
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  security.rtkit.enable = true;
  virtualisation.docker.enable = true;
}
