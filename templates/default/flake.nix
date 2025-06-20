{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } ./layers.nix;

  inputs = {
    dennix.url = "github:vic/dennix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    files.url = "github:mightyiam/files";
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };
}
