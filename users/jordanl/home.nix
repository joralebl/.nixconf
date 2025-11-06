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
    ../../modules/home/browsers.nix
    ../../modules/home/packages.nix
    ../../modules/home/qt.nix
    ../../modules/home/gtk.nix
    ../../modules/home/stylix.nix
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

  services.udiskie = {
    enable = true;
  };
}
