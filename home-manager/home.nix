# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./config/alacritty.nix
    ./config/waybar.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "sakshat";
    homeDirectory = "/home/sakshat";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    # apps
    steam
    discord
    firefox
    brave
    qbittorrent
    spotify
    mpv

    # utils
    cpufetch
    fastfetch
    micro
    wl-clipboard
    clipse
    wget
    xdg-desktop-portal
    networkmanagerapplet
    blueman
    dunst
    wofi
    fd
    btop
    grim
    slurp
    kate
    dolphin
    kdePackages.breeze-icons
    kdePackages.ark
    brightnessctl
    gammastep

    # dev
    rustup
    jetbrains.rust-rover
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };

    # Declared in config
    # alacritty
    # waybar

    # Fonts
    jetbrains-mono
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
 ];

  # mpv config the non-nix way cause lazy
  home.file.".config/mpv/mpv.conf".source = ./config/mpv/mpv.conf;
  home.file.".config/mpv/input.conf".source = ./config/mpv/input.conf;

  # Hyperland -- defining it in home-manager generates a blank .config/hypr/hyprland.conf -- so declared in configuration.nix instead
  # wayland.windowManager.hyprland.enable = true;

  # Sway
  # wayland.windowManager.sway.enable = true;

  # Enable home-manager
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName  = "sakshatshinde";
    userEmail = "shindesakshat@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Environment BROKEN https://www.reddit.com/r/NixOS/comments/1bbfv02/unable_to_change_environment_variables_with/
  # For now using environment.sessionVariables in base configuration
  # home.sessionVariables = {
  #    EDITOR = "micro";
  #    BROWSER = "firefox";
  #    TERMINAL = "alacritty";
  #};



  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
