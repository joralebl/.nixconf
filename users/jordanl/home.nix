{ username, ... }:
{
  imports = [
    ../../modules/home/shell
    ../../modules/home/git.nix
    ../../modules/home/packages.nix
    ../../modules/home/stylix.nix
    ../../modules/home/gtk.nix
    ../../modules/home/niri
    ../../modules/home/scripts
    ../../modules/home/dotfiles.nix
    ../../modules/home/neovim.nix
  ];
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
  programs.git.settings.user = {
    name = "joralebl";
    email = "leblancja@outlook.com";
  };
}
