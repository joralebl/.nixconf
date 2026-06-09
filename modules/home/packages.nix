{
  pkgs,
  osConfig,
  ...
}:
{
  home.packages = with pkgs; [
    # mitscheme
    # aseprite
    # bruno
    (blender.override {
      config.cudaSupport = true;
      config.rocmSupport = false;
    })
    godot
    # (krita.override {
    # config.cudaSupport = true;
    # })
    calibre
    prismlauncher
    # uzdoom
    r2modman
    eden
    # pureref
    qbittorrent
    calcure
    open-in-mpv
    nicotine-plus
    material-maker
    # (llama-cpp.override {
    # config.cudaSupport = true;
    # config.rocmSupport = false;
    # })
    # llama-swap
    # opencode
    dig
    obsidian
    openrgb-with-all-plugins
    gpu-screen-recorder
    tree-sitter
    kitty
  ];
  programs = {
    lutris = {
      enable = true;
      extraPackages = with pkgs; [
        gamemode
        gamescope
        mangohud
        winetricks
        protontricks
        umu-launcher
      ];
      steamPackage = osConfig.programs.steam.package;
    };

    btop = {
      enable = true;
    };

    chromium = {
      enable = true;
    };
    librewolf = {
      enable = true;
      profiles = {
        jordanl = {
          name = "jordanl";
          isDefault = true;
        };
      };
    };

    vesktop = {
      enable = true;
      vencord.useSystem = true;
    };

    mpv = {
      enable = true;
      package = (
        pkgs.mpv.override {
          scripts = with pkgs.mpvScripts; [
            uosc
            twitch-chat
            youtube-chat
            sponsorblock-minimal
            mpris
          ];
        }
      );
      config = {
        input-ipc-server = "/tmp/mpvsocket";
        volume = 45;
      };
    };
    zed-editor = {
      enable = true;
      package = pkgs.zed-editor;
    };
  };

  services = {
    easyeffects.enable = true;
  };
}
