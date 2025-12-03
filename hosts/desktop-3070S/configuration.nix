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

  programs.zsh.enable = true;
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "docker" "i2c"];
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
    mpv
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
    btop
    taskwarrior3
    silver-searcher
    librewolf
    pwvucontrol
    unrar
    unzip
    # ~~~~Niri
    wl-clipboard
    networkmanagerapplet
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ddcutil
  ];

  programs.nix-ld.enable = true;
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
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  virtualisation.docker = {
    enable = true;
  };
}
