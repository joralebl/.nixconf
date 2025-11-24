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
    #prismlauncher
    r2modman
    vesktop
    pureref
    qbittorrent
    calcure
    unrar
    swaybg
  ];

  programs.alacritty.enable = true; # Super+T in the default setting (terminal)
  programs.fuzzel.enable = true; # Super+D in the default setting (app launcher)
  programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
  programs.waybar.enable = true; # launch on startup in the default setting (bar)
  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit
}
