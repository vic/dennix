This collection provides MacOS like keys on linux via keyd.

Provides `flake.modules.nixos.macos-keys`.

Usage:

```
{inputs, ...}: {
  flake.modules.nixos.myhost.imports = [
    inputs.self.modules.nixos.macos-keys
  ];
}
```