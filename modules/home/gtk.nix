{pkgs, ...}: {
  gtk = {
    enable = true;
    colorScheme = "dark";
    iconTheme = {
      name = "Flat-Remix-Green-Dark";
      package = pkgs.flat-remix-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita";
    };
	gtk4.theme = null;
  };
}
