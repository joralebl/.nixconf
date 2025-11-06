{pkgs, ...}: {
  services.xserver.enable = false;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.kaccounts-providers
    kdePackages.kaccounts-integration
    kdePackages.kdepim-addons
    kdePackages.kdepim-runtime
  ];
}
