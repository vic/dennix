{
  flake.modules.nixos.macos-keys =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    {
      services.keyd.enable = true;
      services.keyd.keyboards.default.ids = [ "*" ]; # apply on all devices
      services.keyd.keyboards.default.settings = import ./_keyd.nix;
    };
}
