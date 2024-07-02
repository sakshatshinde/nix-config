{
  config,
  pkgs,
  ...
}: {
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
        background = "#1e1e2e";
        foreground = "#cdd6f4";
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
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
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
