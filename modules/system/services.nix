{...}: {
  services = {
    libinput.enable = true;
    fstrim.enable = true;
    xserver.enable = false;
    fwupd.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;

    gnome.gnome-keyring = {
      enable = true;
    };
  };
}
