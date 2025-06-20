{
  perSystem = {pkgs, ...}: {
    files.files = [
      { path_ = ".gitignore"; drv = pkgs.writeText ".gitignore" ''
        result
      ''; }
    ];
  };
}