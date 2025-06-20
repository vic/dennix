{inputs, ...}: 
let
  dennix = inputs.dennix.modules;
in 
{ 
  imports = [
    (inputs.import-tree ./modules) # your custom dendritic modules.

    dennix.layers.base # like css-reset but for nixos.

    # TODO: list all dennix exposed layers here with a funny description.
    
    # dennix.vix.macos-keys-on-linux # because of muscle memory
  ];
}