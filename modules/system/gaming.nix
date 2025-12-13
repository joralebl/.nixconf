{
  pkgs,
  username,
  ...
}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      gamemode
    ];
    gamescopeSession = {
      enable = true;
      args = [
        "--xwayland-count 2"
        "-e"
        "--steam"

        "--prefer-output DP-1"
        "--output-width 2560"
        "--output-height 1440"
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
    wine-staging
    winetricks
    protontricks
    lutris
    xorg.xrandr
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${username}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode.enable = true;

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
}
