{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-fhs
    jetbrains.idea-community
    docker-compose
    aseprite
    bruno
    bruno-cli
    (blender.override {config.cudaSupport = true;})
    godot
    krita
    # obsidian
    calibre
    #prismlauncher
    r2modman
    vesktop
    pureref
    qbittorrent
    calcure
    kdePackages.zanshin
    kdePackages.kontact
    kdePackages.akonadi
    kdePackages.akonadi-calendar-tools
  ];
}
