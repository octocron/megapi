{
  description = "NixOS configuration for Raspberry Pi 4 | 400 | 500+";

  nixConfig = {
    extra-substituters = [
      "https://nixos-raspberrypi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];
    connect-timeout = 5;
  };

  inputs = {
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    megavim.url = "gitlab:megacron/megavim?ref=nixvim";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-anywhere.url = "github:nix-community/nixos-anywhere";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      disko,
      home-manager,
      megavim,
      nixpkgs,
      nixos-anywhere,
      nixos-raspberrypi,
      nix-index-database,
      self,
      sops-nix,
      ...
    }:
    let
      inherit (self) outputs;
      system = "aarch64-linux";
      username = "megacron";
      gitUsername = "megacron";
      gitEmail = "megacron@d3c3p7.com";
      theLocale = "en_US.UTF-8";
      theTimezone = "America/New_York";
      commonSpecialArgs = {
        inherit inputs;
        inherit outputs;
        inherit system;
        inherit gitEmail;
        inherit gitUsername;
        inherit theLocale;
        inherit theTimezone;
        inherit username;
        inherit (inputs) nixos-raspberrypi;
      };
      personalArgs = {
        inherit gitUsername;
        inherit gitEmail;
        inherit inputs;
        inherit system;
        inherit username;
      };
    in
    {
      # NixOS configurations for each host
      nixosConfigurations = {
        # INFO: Pi400 Niri
        ironhide = nixpkgs.lib.nixosSystem {
          specialArgs = commonSpecialArgs // {
            hostname = "ironhide";
          };
          modules = [
            ./hosts/ironhide/default.nix
            sops-nix.nixosModules.sops
          ];
        };
        # INFO: Pi500+ Niri
        lockdown = nixpkgs.lib.nixosSystem {
          specialArgs = commonSpecialArgs // {
            hostname = "lockdown";
          };
          modules = [
            ./hosts/lockdown/default.nix
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            nix-index-database.nixosModules.nix-index
            sops-nix.nixosModules.sops
            {
              home-manager = {
                extraSpecialArgs = personalArgs // {
                  hostname = "lockdown";
                };
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.${username}.imports = [
                  ./home.nix
                  sops-nix.homeManagerModules.sops
                ];
              };
            }
          ];
        };
        superion = nixpkgs.lib.nixosSystem {
          specialArgs = commonSpecialArgs // {
            hostname = "superion";
          };
          modules = [
            ./hosts/superion/default.nix
            sops-nix.nixosModules.sops
          ];
          disabledModules = [ ./home/ssh.nix ];
        };
        unicron = nixpkgs.lib.nixosSystem {
          specialArgs = commonSpecialArgs // {
            hostname = "unicron";
          };
          modules = [
            ./hosts/whirl/default.nix
            sops-nix.nixosModules.sops
          ];
        };
        # INFO: Pi5 Headless with NVMe
        primus = inputs.nixos-raspberrypi.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = commonSpecialArgs // {
            hostname = "primus";
          };
          modules = [
            ./hosts/primus/default.nix
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            {
              home-manager = {
                extraSpecialArgs = personalArgs // {
                  hostname = "primus";
                };
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.${username}.imports = [
                  ./home.nix
                  sops-nix.homeManagerModules.sops
                ];
              };
            }
          ];
        };
        # INFO: Pi5 Headless with NVMe
        rodimus = nixpkgs.lib.nixosSystem {
          specialArgs = commonSpecialArgs // {
            hostname = "rodimus";
          };
          modules = [
            ./hosts/rodimus/default.nix
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
          ];
        };
      };
    };
}
