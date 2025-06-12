{
  host,
  pkgs,
  ...
}: {
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin
    ];
  };
  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
  ];

  programs.xfconf.enable = true;
}
