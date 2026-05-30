{ pkgs, ... }:
{
  # INFO: NixOS Headless Raspberry Pi5 using NVME
  imports = [
    ../../core
    ./disko.nix
    ./hardware.nix
    ../../users/megacron.nix
  ];

  system.stateVersion = "26.05";
  environment = {
    systemPackages = with pkgs; [
      inputs.megavim.packages.${pkgs.system}.default
      dd
      git
      lsblk
    ];
  };

  #---------------------NETWORKING-----------------------#
  networking = {
    wireless.enable = true;
    networkmanager.enable = true;
    hostName = "primus";
  };

  #---------------------PROGRAMS-------------------------#
  programs.zsh.enable = true;

  #-----------------------SERVICES-----------------------#
  services = {
    fstrim.enable = true; # ssd optimizer
    printing.enable = false;

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
}
