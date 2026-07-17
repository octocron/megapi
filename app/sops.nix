# INFO: For secrets placed at system level like /etc/
# NOTE: $(cat /run/screcrets/someAPIKey) to use a key from secrets
{
  config,
  username,
  ...
}:
{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    age = {
      keyFile = "/home/${username}/.config/sops/age/keys.txt";
    };
    secrets = {
      "passwordHash" = {
        owner = "root";
        group = "root";
        mode = "0400";
        neededForUsers = true;
      };

      "CF_API_TOKEN" = {
        owner = "caddy";
        group = "caddy";
        mode = "0400";
      };
    };

    templates."caddy-env" = {
      content = ''
        CF_API_TOKEN=${config.sops.placeholder.CF_API_TOKEN}
      '';
    };
  };
}
