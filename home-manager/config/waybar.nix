{config, pkgs, ...}:
{
  programs.waybar.enable = true;
   
  programs.waybar.settings = {
  mainBar = {
    layer = "top";
    position = "top";
    height = 26;
    output = [
      "eDP-1"
    ];

    modules-left = [ "custom/logo" ];
    modules-right = [ "cpu" "memory" "network" "clock" "battery" ];
    modules-center = [ "hyprland/workspaces" ];
    
    "custom/logo" = {
      format = "";
      tooltip = false;
    };

    "hyprland/workspaces" = {};
    
    "clock" = {
      interval = 60;
      format = "{󰥔   {:%H:%M}}";
    };

    "battery" = {
          format = "{icon}    {capacity}%";
          format-charging = "     {capacity}%";
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
    font-size: 11px;
  }

  window#waybar {
    background: #292828;
    color: #ffffff;
  }
  
  #custom-logo {
    font-size: 18px;
    margin: 0;
    margin-left: 7px;
    margin-right: 12px;
    padding: 0;
    font-family: NotoSans Nerd Font Mono;
  }
  
  #workspaces button {
    margin-right: 10px;
    color: #ffffff;
  }
  #workspaces button:hover, #workspaces button:active {
    background-color: #292828;
    color: #ffffff;
  }
  #workspaces button.focused {
    background-color: #383737;
  }

  #language {
    margin-right: 7px;		
  }

  #battery {
    margin-left: 7px;
    margin-right: 3px;
  }
  '';
}
