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
    ./config/tofi.nix
    ./config/dunst.nix
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
  home.packages = with pkgs; [
    # apps
    steam
    vesktop
    sabnzbd
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
    ripgrep
    xdg-desktop-portal
    networkmanagerapplet
    blueman
    # dunst
    fd
    eza
    btop
    grim # screenshot
    slurp # screenshot
    cosmic-edit
    cosmic-files
    dolphin
    kdePackages.breeze-icons
    kdePackages.ark
    brightnessctl
    gammastep # nightlight
    powertop
    swaybg
    nwg-look

    # Declared in config
    # alacritty
    # waybar

    # dev stuff
    nil # Nix language server
    nix-info
    nixpkgs-fmt
    alejandra
    zed-editor

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
  home.file.".config/mpv/fonts/GandhiSans-Regular.otf".source = ./config/mpv/fonts/GandhiSans-Regular.otf;
  home.file.".config/mpv/fonts/GandhiSans-BoldItalic.otf".source = ./config/mpv/fonts/GandhiSans-BoldItalic.otf;
  home.file.".config/mpv/fonts/GandhiSans-Italic.otf".source = ./config/mpv/fonts/GandhiSans-Italic.otf;
  home.file.".config/mpv/fonts/GandhiSans-Bold.otf".source = ./config/mpv/fonts/GandhiSans-Bold.otf;

  # Programs managed by HM
  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "eza --icons=always";
      cat = "bat";
      grep = "ripgrep";
      find = "fd";
      hms = "home-manager switch --flake /home/sakshat/Dev/nix-config";
      nixup = "sudo nixos-rebuild switch --flake /home/sakshat/Dev/nix-config";
      dev = "cd ~/Dev/";
    };
  };

  programs.git = {
    enable = true;
    userName = "sakshatshinde";
    userEmail = "shindesakshat@gmail.com";

    aliases = {
      a = "add -p";
      # expects your private key with usr perms 600 in ~/Keys dir named "github"
      # use with GIT_SSH_COMMAND='ssh -i ~/Keys/github -o IdentitiesOnly=yes'
      ps = "push";
      p = "pull";
      cm = "commit -m";
      f = "fetch";
      fo = "fetch origin";
      st = "status";
    };
  };

  # Better `cat`
  programs.bat.enable = true;
  # Type `z <pat>` to cd to some directory
  programs.zoxide.enable = true;
  # Type `<ctrl> + r` to fuzzy search your shell history
  programs.fzf.enable = true;
  programs.jq.enable = true;

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
