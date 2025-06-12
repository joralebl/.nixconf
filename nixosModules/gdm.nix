{...}: {
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
    autoSuspend = true;
  };
}
