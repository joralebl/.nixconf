{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.windowManagers.niri;
in
{
  imports = [ inputs.niri.nixosModules.niri ];

  options.windowManagers.niri = {
    enable = lib.mkEnableOption "niri compositor";
    niriPackage = lib.mkOption {
      type = lib.types.package;
      default = pkgs.niri-unstable;
      description = "The niri package to use";
    };
  };

  config = lib.mkIf cfg.enable {

    nixpkgs.overlays = [ inputs.niri.overlays.niri ];
    programs.niri.enable = true;
    programs.niri.package = cfg.niriPackage;

    environment.systemPackages = with pkgs; [
      wl-clipboard
      networkmanagerapplet
    ];
  };
}
