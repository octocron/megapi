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

    ../../app/sddm.nix
    ../../app/sops.nix

    ../../boot/pi5.nix
    ../../core
    ../../users/megacron.nix
  ];

  environment = {
    systemPackages = [
      inputs.caelestia-shell.packages.${pkgs.system}.with-cli
      inputs.megavim.packages.${pkgs.system}.default
    ]
    ++ (with pkgs; [
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
    ]);

    sessionVariables = {
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
      XDG_SESSION_TYPE = "wayland";
      XDG_TERMINAL_EMULATOR = "wezterm";
    };
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
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
