{inputs, ...}:
{
  imports = [ inputs.files.flakeModules.default ];

  perSystem = { config, ...}: {
    packages.files = config.files.writer.drv;
  };
}