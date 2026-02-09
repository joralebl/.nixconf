{pkgs,...}: {
  home.packages = with pkgs; [
    ristretto
    grim
    slurp
    swappy
    file-roller
    argyllcms
  ];

  services = {
    playerctld.enable = true;
    udiskie.enable = true;
    # xembed-sni-proxy.enable = true;
    mako.enable = true;
    # swayidle = let
    #   display = status: "${pkgs.niri-unstable}bin/niri msg action power-${status}-monitors";
    #   lock = "/run/current-system/sw/bin/noctalia-shell ipc call lockscreen lock";
    # in {
    #   enable = true;
    #   timeouts = [
    #     {
    #       timeout = 60;
    #       command = lock;
    #     }
    #
    #     {
    #       timeout = 90;
    #       command = display "off";
    #       resumeCommand = display "on";
    #     }
    #   ];
    #   events = [
    #     {
    #       event = "before-sleep";
    #       command = (display "off") + "; " + lock;
    #     }
    #     {
    #       event = "after-resume";
    #       command = display "on";
    #     }
    #     {
    #       event = "lock";
    #       command = (display "off") + "; " + lock;
    #     }
    #     {
    #       event = "unlock";
    #       command = display "on";
    #     }
    #   ];
    # };
  };
}
