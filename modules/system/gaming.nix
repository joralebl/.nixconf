{
  pkgs,
  username,
  ...
}:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      gamemode
      mangohud
    ];
    protontricks.enable = true;
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
    protonup-ng
    wine-staging
    winetricks
    protontricks
    xrandr
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${username}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
      };
      # custom = {
      #   start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
      #   end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      # };
    };
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };
  programs.rsi-launcher = {
    enable = true;
    preCommands = ''
      export DXVK_HUD=compiler;
      export MANGO_HUD=1;
    '';
    setLimits = true;
  };
}
