{ pkgs, ... }:
{
  description = "NixOS Headless Raspberry Pi5 using NVME";
  imports = [
    ../core
    ./disko.nix
    ../users/megacron/default.nix
  ];

  #---------------------BOOT-----------------------------#
  boot = {
    loader.raspberry-pi.bootloader = "kernel";
    tmp.useTmpfs = true;
  };

  #---------------------NETWORKING-----------------------#
  networking = {
    wireless.enable = true;
    networkmanager.enable = true;
    hostName = "primus";
  };

  #-----------------------SERVICES-----------------------#
  services = {
    # List services that should be enabled:
    fstrim.enable = true; # ssd optimizer
    libinput.enable = true; # input handler
    printing.enable = false;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };

    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PermitRootLogin = "no"; # prevent root from SSH login
        PasswordAuthentication = true; # users can SSH using username and password
        KbdInteractiveAuthentication = true; # allow keyboard based auth
      };
    };
  };

  environment = {
    # etc = {
    #   # Minimal packages
    #
    #   "nixos/sops-configuration.nix" = {
    #     source = ./sops-configuration.nix;
    #     mode = "0644";
    #   };
    #   # Include sops configuration files
    #   "nixos/.sops.yaml" = lib.mkIf (builtins.pathExists ./.sops.yaml) {
    #     source = ./.sops.yaml;
    #     mode = "0644";
    #   };
    #   "nixos/secrets.yaml" = lib.mkIf (builtins.pathExists ./secrets.yaml) {
    #     source = ./secrets.yaml;
    #     mode = "0600";
    #   };
    # };

    system.stateVersion = "26.05";
    systemPackages = with pkgs; [
      inputs.megavim.packages.${pkgs.system}.default
      dd
      git
      lsblk
    ];
  };
}
