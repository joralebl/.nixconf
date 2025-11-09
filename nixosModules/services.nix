{...}: {
  services = {
    libinput.enable = true;
    fstrim.enable = true;
    xserver.enable = false;
    fwupd.enable = true;
  };
}
