# My NixOS config0 

Refer https://wiki.archlinux.org/title/wpa_supplicant for wireless install

or use nmcli

```sh
nmcli dev wifi connect <mySSID> password <myPassword
```

```sh
$ cp /etc/nixos/hardware-configuration.nix .
```

```bash
$ nix-shell -p git

# inside nix-config
$ sudo nixos-rebuild switch --flake .#sakshat
```

```sh
$ nix shell nixpkgs#home-manager

# inside nix-config
$ home-manager switch --flake .#sakshat@nixos
```
