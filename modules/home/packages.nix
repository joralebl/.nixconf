{pkgs, ...}: {
  home.packages = with pkgs; [
    vscodium-fhs
    jetbrains.idea-oss
    mitscheme
    aseprite
    # bruno
    # bruno-cli
    (blender.override {
      config.cudaSupport = true;
      config.rocmSupport = false;
    })
    godot
    krita
    calibre
    prismlauncher
    r2modman
    pureref
    qbittorrent
    calcure
    # lc3tools
    # gnu-smalltalk
    # nmap
    # projectlibre
    open-in-mpv
    nicotine-plus
    swayidle
    material-maker
  ];
  programs.btop = {
    enable = true;
  };
  programs.chromium = {
    enable = true;
  };
  programs.librewolf = {
    enable = true;
    profiles = {
      jordanl = {
        name = "jordanl";
        isDefault = true;
      };
    };
  };

  programs.vesktop = {
    enable = true;
    vencord.useSystem = true;
  };

  programs.mpv = {
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
  # services.xembed-sni-proxy.enable = true;
}
