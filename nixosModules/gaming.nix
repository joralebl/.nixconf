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
    gamescopeSession.enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };
  environment.systemPackages = with pkgs; [
    mangohud
    protonup
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
    args = [
      "--rt"
      "--expose-wayland"
    ];
  };

  hardware.steam-hardware.enable = true;
}
