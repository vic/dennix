{ inputs, lib, ... }:
{
  flake.lib.hostsBySystem =
    system:
    let
      self = inputs.self;
      where =
        if lib.hasSuffix "darwin" system then self.darwinConfigurations else self.nixosConfigurations;
      sameSystem = lib.filterAttrs (_: v: v.config.nixpkgs.hostPlatform.system == system) where;
    in
    lib.attrNames sameSystem;
}
