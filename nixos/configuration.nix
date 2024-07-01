# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs
, lib
, config
, pkgs
, ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
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

      # Enable all firmwares mostly for battery life
      hardware.enableAllFirmware = true;
      hardware.cpu.intel.updateMicrocode = true;
      hardware.enableRedistributableFirmware = true;
      hardware.firmware = with pkgs; [ firmwareLinuxNonfree ];

      # Enable firmware update service
      services.fwupd.enable = true;
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";

        # Opinionated: disable global registry
        flake-registry = "";

        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;

        # gc
        auto-optimise-store = true;

      };
      # Opinionated: disable channels
      channel.enable = false;

      # gc
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  # Bootloader == systemd
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;
  boot.plymouth.theme = "bgrt";
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Dynamic linking
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];
  # https://github.com/Mic92/envfs
  services.envfs.enable = true;

  # Save some power - https://nixos.wiki/wiki/Laptop
  services.thermald.enable = true;
  powerManagement.powertop.enable = true;

  # Networking via wpa_supplicant
  # networking.hostName = "nixos";
  # networking.wireless.enable = true;
  # networking.wireless.networks.<SSID>.psk = "<psk>";

  # Networking via nmcli
  networking.networkmanager.enable = true;

  # Ram cope
  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024;
  }];
  zramSwap.enable = true;

  # Intel GPU Drivers
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      #intel-media-driver -- bad for browsers both firefox and chrome
      #intel-media-sdk
      intel-vaapi-driver # older but better
      libvdpau-va-gl
    ];
  };

  # Locale and stuff
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_MONETARY = "en_US.UTF-8";
    LC_MESSAGES = "en_US.UTF-8";
  };

  # ENV varibales
  environment.sessionVariables = {
    TERMINAL = "alacritty";
    EDITOR = "micro";
    BROWSER = "firefox";
  };

  # Polkit - required for hyprland
  security.polkit.enable = true;

  programs.hyprland.enable = true;
  programs.gamemode.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  # hardware.bluetooth.powerOnBoot = true;

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  services.pipewire.wireplumber.extraConfig = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
    };
  };

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    sakshat = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "123";
      isNormalUser = true;

      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  # Autologin
  services.getty.autologinUser = "sakshat";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
