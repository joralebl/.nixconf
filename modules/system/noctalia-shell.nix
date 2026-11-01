{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.desktops.noctalia-shell;
in
{

  options.desktops.noctalia-shell = {
    enable = lib.mkEnableOption "Noctalia Shell desktop";
  };

  config = lib.mkIf cfg.enable {
    nix.settings = {
      substituters = [ "https://noctalia.cachix.org" ];
      trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
    };

    environment.systemPackages = [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.ddcutil
      pkgs.pwvucontrol
    ];
  };
}
