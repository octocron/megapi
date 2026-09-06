{ pkgs, ... }: {
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

      uptime prefix="Uptime"

      load-avg format="Load: {one:.02} {five:.02} {fifteen:.02}"

      memory swap-pos="beside"

      filesystems {
        filesystem name="/" mount-point="/"
        filesystem name="/home" mount-point="/home"
      }

      service-status {
        service display-name="Caddy" unit="caddy.service"
        service display-name="SSH" unit="sshd.service"
        service display-name="Unbound" unit="unbound.service"
      }

      last-run
    }
  '';

  users.motdFile = "/etc/rust-motd";

  system.activationScripts.rust-motd = ''
    ${pkgs.rust-motd}/bin/rust-motd /etc/rust-motd.kdl > /etc/rust-motd
  '';
}
