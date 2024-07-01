## Dots of mine ... NixOS ... Hyprland ... Wayland ... Waybar ... 

![NixOS_Banner](https://github.com/sakshatshinde/nix-config/assets/30901276/bda7b5aa-8502-4ddf-8dd1-bc8ceb8265ce)

![Screenshot-2024-07-01_08:21:57](https://github.com/sakshatshinde/nix-config/assets/30901276/b6023a42-e39a-4751-99ab-bf8089b484cf)
![Screenshot-2024-07-01_08:30:13](https://github.com/sakshatshinde/nix-config/assets/30901276/4704dfb6-994e-4d96-beeb-43bdbf506581)

Refer https://wiki.archlinux.org/title/wpa_supplicant for wireless install or use nmcli

```sh
$ nmcli dev wifi connect <mySSID> password <myPassword>
```

```sh
$ cp /etc/nixos/hardware-configuration.nix .
```

```bash
$ nix-shell -p git

# inside nix-config
$ sudo nixos-rebuild switch --flake .#sakshat
```

Download a wallpaper and place it in `~/Downloads/wallpaper.jpg`

```sh
$ nix shell nixpkgs#home-manager

# inside nix-config
$ home-manager switch --flake .#sakshat@nixos
```
