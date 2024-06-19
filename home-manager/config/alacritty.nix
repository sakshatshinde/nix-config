{config, pkgs, ...}:
{
  # https://github.com/alacritty/alacritty-theme/tree/master/themes
  programs.alacritty.enable = true;
  
  programs.alacritty.settings = {
  env = {
    TERM = "alacritty";
  };

  working_directory = "/home/sakshat";

  window = {
    padding = {
      x = 12;
      y = 12;
    };
  };
    
  scrolling = {
    history = 10000; 
    multiplier = 3;
  };

  font = {
    normal = {
      family = "JetBrains Mono"; 
      style = "Regular";
    };

  size = 12;

  builtin_box_drawing = true;
  };

  colors = {
    primary = {
      background = "#181818";
      foreground = "#b9b9b9";
    };

    cursor = {
      text = "CellBackground";
      cursor = "CellForeground";
    };

    vi_mode_cursor = {
      text = "CellBackground";
      cursor = "CellForeground";
    };
  
    normal = {
      black = "#3b3b3b";
      red = "#ed4a46";
      green = "#70b433";
      yellow = "#dbb32d";
      blue = "#368aeb";
      magenta = "#eb6eb7";
      cyan = "#3fc5b7";
      white = "#b9b9b9";
    };

    transparent_background_colors = true;
  };

  live_config_reload = true;

  keyboard.bindings = [
    { 
      key = "C"; 
      mods = "Control"; 
      action = "Copy"; 
    }
    { 
      key = "V"; 
      mods = "Control"; 
      action = "Paste"; 
    } 
    { 
      key = "O"; 
      mods = "Control"; 
      action = "ScrollHalfPageUp"; 
    }
    { 
      key = "P"; 
      mods = "Control"; 
      action = "ScrollHalfPageDown"; 
    }
    { 
      key = "Equals"; 
      mods = "Control"; 
      action = "IncreaseFontSize"; 
    }
    { 
      key = "Plus"; 
      mods = "Control"; 
      action = "IncreaseFontSize"; 
    }
    { 
      key = "Minus"; 
      mods = "Control"; 
      action = "DecreaseFontSize"; 
    }
  ];

  debug = {
    render_timer = false;
    persistent_logging = false;
    log_level = "Warn";
    print_events = false;
  };
  };
}
