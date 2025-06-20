A simple function that generates an module allowing unfree packages by name.

Usable in nixos/darwin and home-manager modules.

Exposes `self.lib.unfree-module` that takes a list of packages names.

Usage:

```nix
{inputs, ...}: {
    flake.modules.nixos.myhost.imports = [
      inputs.self.lib.unfree-module ["nvidia"]
    ];
}
```