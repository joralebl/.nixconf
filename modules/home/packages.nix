{pkgs, ...}: {
  home.packages = with pkgs; [
    #dev
    vscode-fhs
    docker-compose
    aseprite
    bruno
    bruno-cli
    blender
    godot
    krita

    #productivity
    obsidian
    calibre

    #games
    prismlauncher
    r2modman

    #etc
    vesktop
  ];
}
