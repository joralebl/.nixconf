{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-fhs
    docker-compose
    aseprite
    bruno
    bruno-cli
    (blender.override {config.cudaSupport = true;})
    godot
    krita
    #obsidian
    calibre
    #prismlauncher
    r2modman
    vesktop
    wf-recorder
    pureref
    qbittorrent
  ];
}
