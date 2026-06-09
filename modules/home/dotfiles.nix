{
  config,
  username,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/.nixconf/users/${username}/dotfiles/";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    nvim = "nvim";
    kitty = "kitty";
  };
in

{
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;
}
