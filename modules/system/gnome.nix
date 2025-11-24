{pkgs, ...}: {
  #Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
  };

  services.gnome.gnome-keyring.enable = true;
  programs.ssh.startAgent = false;

  environment.systemPackages = with pkgs.gnomeExtensions; [
    tiling-assistant
  ];
}
