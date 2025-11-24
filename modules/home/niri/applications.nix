{pkgs}: {
  browser = "librewolf";
  terminal = "${pkgs.kitty}/bin/kitty";
  fileManager = "${pkgs.xfce.thunar}/bin/thunar";
  appLauncher = "${pkgs.fuzzel}/bin/fuzzel";
}
