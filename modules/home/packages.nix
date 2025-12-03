{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-fhs
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
    vesktop
    pureref
    qbittorrent
    calcure
    lc3tools
  ];
}
