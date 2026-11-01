{ config, lib, ... }:
let
  cfg = config.flatpak;
in
{
  options.flatpak = {
    enable = lib.mkEnableOption "enable flatpak";
  };

  config = lib.mkIf cfg.enable {
    services.flatpak.enable = true;
  };
}
