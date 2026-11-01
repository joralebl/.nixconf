{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.greeters.noctalia-greeter;
in
{
  options.greeters.noctalia-greeter = {
    enable = lib.mkEnableOption "noctalia greeter";
  };

  config = lib.mkIf cfg.enable {
    services.displayManager.noctalia-greeter = {
      enable = true;
      cursorTheme = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
      };
    };
  };
}
