{pkgs, ...}: {
  home.packages = with pkgs; [
    xfce.ristretto
    xarchiver
    grim
    slurp
    swappy
  ];

  services = {
    playerctld.enable = true;
    udiskie.enable = true;
    xembed-sni-proxy.enable = true;
    mako.enable = true;
    swayidle.enable = true;
  };
}
