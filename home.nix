{ username, ... }:
{
  #----------------Home Manager-----------------------------#
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
    file = {
      ".config/starship.toml".source = ./home/cli/starship.toml;
      ".config/wezterm/wezterm.lua".source = ./home/cli/wezterm.lua;
      ".config/vim" = {
        source = ./home/cli/vim;
        recursive = true;
      };
    };
  };

  #-----------------Home-Modules-----------------------------#
  imports = [
    ./home
  ];

  #-----------------Builtin Programs-------------------------#
  programs = {
    home-manager.enable = true;
    command-not-found.enable = false; # mutex to nix-index (using ShellInit script in zsh.nix)
    jq.enable = true;
  };

  #----------------Editor Config-----------------------------#
  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        indent_style = "space";
        indent_size = 2;
        end_of_line = "lf";
        charset = "utf-8";
      };
      "*.{js,py,rs}" = {
        indent_size = 4;
      };
      "*.md" = {
        trim_trailing_whitepace = false;
      };
      "*.nix" = {
        trim_trailing_whitespace = true;
      };
    };
  };
}
