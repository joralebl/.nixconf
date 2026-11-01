{
  config,
  pkgs,
  inputs,
  lib,
  username,
  host,
  system,
  ...
}:
{
  system.stateVersion = "24.05";
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.zsh.enable = true;
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://nix-citizen.cachix.org"
    ];
    trusted-public-keys = [
      "nix-citizen.cachix.org-1:lPMkWc2X8XD4/7YPEEwXKKBg+SVbYTVrAaLA2wQTKCo="
    ];
  };
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };
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
    fastfetch.minimal
    eza
    bat
    mcfly
    fd
    ripgrep
    gnumake
    cargo
    rebar3
    taskwarrior3
    unrar
    unzip
  ];
  programs.starship = {
    enable = true;
    presets = [
      "pure-preset"
    ];
  };
  programs.nix-ld = {
    enable = true;
  };
  security.rtkit.enable = true;
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

  fileSystems = {
    "/home/jordanl/Store" = {
      device = "/dev/disk/by-uuid/f0e41fd2-331a-4265-8938-b1f3bb4b4da8";
      fsType = "btrfs";
      options = [ "defaults" ];
    };

    "/home/jordanl/Extra" = {
      device = "/dev/disk/by-uuid/b93b2fa6-4a76-4cd7-85f9-fd035d2f11a4";
      fsType = "ext4";
      options = [ "defaults" ];
    };
  };
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];
  zramSwap = {
    enable = true;
    memoryMax = 32 * 1024 * 1024 * 1024;
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

}
