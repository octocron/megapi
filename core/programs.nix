{ username, ... }:
{
  #---------------------PROGRAMS-------------------------#
  programs = {
    zsh.enable = true;

    nh = {
      enable = true;
      flake = "/home/${username}/projects/megapi";
      clean = {
        enable = true;
        extraArgs = "--keep-since 40d --keep 10";
      };
    };
  };
}
