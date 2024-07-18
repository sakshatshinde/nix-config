{pkgs, ...}: let
  inherit (pkgs) libnotify papirus-icon-theme;
in {
  home.packages = [libnotify];

  services.dunst = {
    enable = true;

    iconTheme = {
      package = papirus-icon-theme;
      name = "Papirus";
    };

    settings = {
      global = {
        frame_color = "#8caaee";
        separator_color = frame;
        geometry = "1870x5-25+45";
        width = 350;
        separator_height = 5;
        padding = 24;
        horizontal_padding = 24;
        frame_width = 3;
        idle_threshold = 120;
        alignment = "center";
        word_wrap = "yes";
        transparency = 5;
        format = "<b>%s</b>: %b";
        markup = "full";
        min_icon_size = 32;
        max_icon_size = 128;
      };

      urgency_low = {
        background = "#303446";
        foreground = "#c6d0f5";
      };

      urgency_normal = {
        background = "#303446";
        foreground = "#c6d0f5";
      };

      urgency_critical = {
        background = "#303446";
        foreground = "#c6d0f5";
        frame_color = "#ef9f76";
      };
    };
  };
}
