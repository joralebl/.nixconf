{
  config,
  pkgs,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
  };

  hardware.cpu.amd.updateMicrocode = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
