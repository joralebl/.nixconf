{...}: {
  services.displayManager.ly = {
    enable = true;
    settings = {
      animate = true;
      animation = "cmatrix";
      clock = "%c";
      bigclock = true;
      hide_f1_commands = true;
    };
  };
}
