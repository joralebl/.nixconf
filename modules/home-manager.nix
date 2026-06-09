{
  usernames,
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  inherit usernames;
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager.userGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users =
    lib.mkMerge
    (map (
        user:
          lib.mkIf (builtins.pathExists ../users/${user}/home.nix) {${user}.imports = [../users/${user}/home.nix];}
      )
      usernames);
}
