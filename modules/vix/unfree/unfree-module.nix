{
  flake.lib.unfree-module =
    names:
    { lib, ... }:
    {
      nixpkgs.config.allowUnfreePredicate = pkg: lib.elem (lib.getName pkg) names;
    };
}
