{
  config,
  pkgs,
  ...
}: {
  programs.waybar.enable = true;

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 26;
      output = [
        "eDP-1"
      ];

      modules-left = ["custom/logo" "clock" "bluetooth"];
      modules-right = ["cpu" "network" "battery"];
      modules-center = ["hyprland/workspaces"];

      "bluetooth" = {
        format = "   {status}";
        format-disabled = "";
        format-connected = "   {num_connections}";
      };

      "custom/logo" = {
        format = "";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        tooltip = false;
        all-outputs = true;
        format-icons = {
          active = "";
          default = "";
        };
      };

      "memory" = {
        interval = "2";
        format = "RAM: {usage}GiB |";
      };

      "cpu" = {
        interval = "1";
        format = "❤️ {max_frequency}GHz";
        max-length = 13;
        min-length = 13;
        # on-click = "alacritty -e htop --sort-key PERCENT_CPU";
        tooltip = false;
      };

      "network" = {
        format = "  ";
        format-ethernet = "  ";
        tooltip = false;
      };

      "battery" = {
        format = "{icon}   {capacity}%";
        format-charging = "⚡{capacity}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        states = {
          critical = 20;
        };
        tooltip = false;
      };
    };
  };

  programs.waybar.style = ''

    * {
      border: none;
      border-radius: 0;
      padding: 0;
      margin: 0;
      font-size: 12px;
      color: #b4befe
    }

    window#waybar {
      background: #11111b;
      color: #ffffff;
    }

    #custom-logo {
      font-size: 18px;
      margin: 0;
      margin-left: 7px;
      margin-right: 12px;
      padding: 0;
      font-family: Fira Code;
      color: #b4befe;
    }

    #workspaces button {
      color: #b4befe;
    }

    #battery {
      margin-left: 7px;
      margin-right: 5px;
      color: #b4befe;
    }
  '';
}
