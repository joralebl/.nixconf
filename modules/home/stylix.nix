{pkgs, ...}: {
  stylix.targets = {
    gtk.enable = true;
    qt.enable = true;
    kde.enable = true;
    vencord.enable = true;
    vesktop.enable = true;
    librewolf = {
      enable = true;
      profileNames = ["jordanl"];
    };
    bat.enable = true;
    btop.enable = true;
    vscode.enable = true;
    niri.enable = true;
  };
  stylix.icons = {
    enable = true;
    package = pkgs.flat-remix-icon-theme;
    dark = "Flat-Remix-Red-Dark";
  };
}
