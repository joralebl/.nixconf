{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nautilus
    code-nautilus
	nautilus-python
  ];
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
  services.gvfs.enable = true;
}

