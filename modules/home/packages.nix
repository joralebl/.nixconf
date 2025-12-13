{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-fhs
    zed-editor-fhs
    jetbrains.idea-community
    docker-compose
    mitscheme
    aseprite
    bruno
    bruno-cli
    (blender.override {config.cudaSupport = true;})
    godot
    krita
    # obsidian
    calibre
    prismlauncher
    r2modman
    pureref
    qbittorrent
    calcure
    lc3tools
    gnu-smalltalk
    nmap
    projectlibre
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
		default = {
			name = "default";
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
      pkgs.mpv-unwrapped.wrapper {
        scripts = with pkgs.mpvScripts; [
          uosc
          twitch-chat
          youtube-chat
          youtube-upnext
        ];

        mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
        };
      }
    );
  };
}
