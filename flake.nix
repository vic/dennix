{
  # NOTICE: This flake should not depend on anything besides import-tree.
  #
  # The reason is we want this flake to be imported by lots of people
  # without adding dependencies to them. Since dennix only exposes
  # different collections of pre-configured flake-parts modules.
  #
  # Each collection has a category and name, and is loaded by import-tree from 
  #
  #    ./modules/<category>/<name>/**.nix
  #
  # and exposed on the flake as a single module:
  #
  #    modules.${category}.${name}
  #
  #
  # <category>/<name> provides a namespace for organizing content
  # by their purpose, eg, "layer/kde" or "vix/kde" where the
  # first is intended to be totally generic and the second vendor opinionated.
  # both of these example kde layers can contribute to `modules.nixos.kde`.
  #
  # Each collection should provide a README describing the collection content.
  #
  # Each <category>/<name> directory is exposed as a single module having
  # all its flake-parts files included automatically. And these modules are free
  # to configure different nix module clases as they see fit.
  # 
  # Users are required to know only the name of the collection they want to use.
  # And they will import the corresponding module into a flake-parts module of their own.
  inputs.import-tree.url = "github:vic/import-tree";
  outputs = {import-tree, ...}: let 
    inherit (builtins) mapAttrs readDir;

    load = dir: mapAttrs (n: _: import-tree "${dir}/${n}") (readDir dir);
    modules = mapAttrs (n: _: load ./modules/${n}) (readDir ./modules);

  in { 
    inherit modules;
  };
}