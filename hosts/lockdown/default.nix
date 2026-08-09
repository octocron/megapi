{
  inputs,
  pkgs,
  ...
}:
{
  # INFO: NixOS Headless Raspberry Pi5 using NVME
  system.stateVersion = "26.05";
  imports = [
    ./disko.nix
    ./hardware.nix
    ./nebula.nix
    ../../boot/pi5.nix
    ../../core
    ../../home/gui
    ../../home/wm/caelestia
    ../../users/megacron.nix
    ../../app/sops.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      inputs.caelestia-shell.packages.${pkgs.system}.with-cli
      brightnessctl
      grim
      hyprpicker
      libnotify
      networkmanagerapplet
      playerctl
      pwvucontrol
      slurp
      swappy
      uwsm
      wl-clipboard
    ];
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  services = {
    blueman.enable = true;

    fstrim.enable = true; # ssd optimizer
    gvfs.enable = true; # allow gtk based file managers to browse samba shares

    libinput.enable = true; # input handler
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    printing.enable = false;
    tumbler.enable = true; # image/video previewer
    udisks2.enable = true; # USB auto mounting

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
