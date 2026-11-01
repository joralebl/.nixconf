{
  config,
  lib,
  ...
}:
let
  cfg = config.gpuVendor.nvidia;
in
{
  options.gpuVendor.nvidia = {
    enable = lib.mkEnableOption "Nvidia GPU support";
    open = lib.mkOption {
      type = lib.types.bool;
      description = "Use the open-source kernel module?";
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    boot.blacklistedKernelModules = [
      "nouveau"
      "nova_core"
    ];

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      open = cfg.open;
      nvidiaSettings = true;
      videoAcceleration = true;
      #forceFullCompositionPipeline = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

  };
}
