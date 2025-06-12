{...}: {
  services = {
    libinput.enable = true;
    fstrim.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    blueman.enable = true;
    tumbler.enable = true;
    gnome.gnome-keyring.enable = true;
    xserver.enable = false;
  };
}
