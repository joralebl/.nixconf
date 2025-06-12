{
  username,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home/shell
    ../../modules/home/hyprland
    ../../modules/home/nixvim
    ../../modules/home/emoji.nix
    ../../modules/home/git.nix
    ../../modules/home/kitty.nix
    ../../modules/home/browsers.nix
    ../../modules/home/packages.nix
    ../../modules/home/swaync.nix
    ../../modules/home/qt.nix
    # ../../modules/home/xdg.nix
    ../../modules/home/gtk.nix
    ../../modules/home/scripts
    ../../modules/home/rofi
    ../../modules/home/stylix.nix
    ../../modules/home/wlogout
    ../../modules/home/waybar/waybar-simple.nix
  ];
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
  programs.git = {
    userName = "leblancja";
    userEmail = "leblancja@outlook.com";
  };

  services.udiskie = {
    enable = true;
  };
}
