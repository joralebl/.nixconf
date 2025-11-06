{
  pkgs,
  lib,
  username,
  ...
}: {
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
    gcc
    gnumake
    cargo
    rebar3
    btop
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

  security.rtkit.enable = true;
  security.polkit.enable = true;
  programs.dconf.enable = true;
  services.dbus.enable = true;

  virtualisation.docker = {
    enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
