Some simple functions that instantiate nixos/nix-darwin os configurations.

Example usage on a dendritic module of yours:

```nix
{
  flake.nixosConfigurations = {
    annatar = mk-os.wsl "annatar";
    mordor = mk-os.linux "mordor";
    bill = mk-os.linux-arm "bill";
  };

  flake.darwinConfigurations = {
    yavanna = mk-os.darwin-intel "yavanna";
    varda = mk-os.darwin-arm "varda";
  };
}
```