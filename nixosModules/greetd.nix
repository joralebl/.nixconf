{
  pkgs,
  username,
  ...
}: {
  services.greetd = {
    enable = true;

    vt = 1;
    settings = {
      unitConfig.After = ["docker.service"];
      serviceConfig = {
        Type = "idle";
        # StandardInput = "tty";
        # StandardOutput = "tty";
        # StandardError = "journal";
        # TTYReset = true;
        # TTYVHangup = true;
        # TTYVTDisallocate = true;
      };

      default_session = {
        command = "${pkgs.greetd.wlgreet}/bin/wlgreet --time --remember --remember-session";
        user = "greeter";
      };
    };
  };
}
