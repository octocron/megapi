{
  config,
  lib,
  pkgs,
  ...
}:
let
  rustMotd = pkgs.writeShellScript "rust-motd-login" ''
    export PATH="${
      lib.makeBinPath [
        pkgs.bash
        pkgs.figlet
        pkgs.inetutils
      ]
    }:$PATH"

    exec ${pkgs.rust-motd}/bin/rust-motd /etc/rust-motd.kdl
  '';
in
{
  environment.systemPackages = [
    pkgs.rust-motd
  ];

  environment.etc."rust-motd.kdl".text = ''
    global {
      version "1.0"
      progress-full-character "━"
      progress-empty-character "─"
      progress-prefix "["
      progress-suffix "]"
      time-format "%Y-%m-%d %H:%M:%S %Z"
    }

    components {
      command "hostname | figlet -f slant"
      memory swap-pos="beside"

      filesystems {
        filesystem name="/" mount-point="/"
      }

      service-status {
        service display-name="Caddy" unit="caddy.service"
        service display-name="Nebula" unit="nebula@megaport.service"
        service display-name="SSH" unit="sshd.service"
        service display-name="Unbound" unit="unbound.service"
      }
      load-avg format="Load: {one:.02} {five:.02} {fifteen:.02}"

      uptime prefix="Uptime"
      last-run
    }
  '';

  # NOTE: rust-motd is generated at SSH login
  security.pam.services.sshd = {
    showMotd = lib.mkForce false;

    rules.session.rust-motd = {
      enable = true;
      order = 12300;
      control = "optional";
      modulePath = "${config.security.pam.package}/lib/security/pam_exec.so";
      args = [
        "stdout"
        "${rustMotd}"
      ];
    };
  };
}
