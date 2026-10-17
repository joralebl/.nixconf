{
  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:epireyn/niri-flake";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
    };

    nix-citizen = {
      url = "github:LovingMelody/nix-citizen";
    };
    comfyui-nix.url = "github:utensils/comfyui-nix";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.helium = pkgs.callPackage ./derivations/helium.nix { };
      defaultPackage.${system} = self.packages.${system}.helium;

      nixosConfigurations = {
        desktop-3070S =
          let
            host = "desktop-3070S";
            username = "jordanl";
            specialArgs = { inherit inputs host username self; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            system = "x86_64-linux";

            modules = [
              inputs.nix-citizen.nixosModules.default
              inputs.stylix.nixosModules.stylix
              ./hosts/${host}
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  backupFileExtension = "bak";
                  extraSpecialArgs = inputs // specialArgs;
                  users.${username} = import ./users/${username}/home.nix;
                };
              }
            ];
          };
        protosrv =
          let
            host = "protosrv";
            specialArgs = { inherit inputs host; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            system = "x86_64-linux";

            modules = [
              ./hosts/${host}
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  backupFileExtension = "bak";
                  extraSpecialArgs = inputs // specialArgs;
                  users.proto = import ./users/proto/home.nix;
                };
              }
            ];
          };
      };
    };
}
