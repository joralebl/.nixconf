{
  username,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home/shell
    ../../modules/home/nixvim
    ../../modules/home/git.nix
    ../../modules/home/kitty.nix
    ../../modules/home/packages.nix
    ../../modules/home/stylix.nix
    ../../modules/home/gtk.nix
    ../../modules/home/qt.nix
    ../../modules/home/niri
    ../../modules/home/scripts
  ];
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
  programs.git.settings.user = {
    name = "leblancja";
    email = "leblancja@outlook.com";
  };
}
