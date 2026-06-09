{ pkgs, ... }:
{
  home.packages = with pkgs; [
    loupe
    grim
    slurp
    swappy
    file-roller
    argyllcms
  ];

  services = {
    playerctld.enable = true;
    udiskie.enable = true;
    # mako.enable = true;
  };
}
