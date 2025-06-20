let
  README = #markdown
  ''
    ${builtins.readFile ./../README.md}
  '';
in
{
  perSystem = {pkgs, ...}: {
    files.files = [
      { path_ = "README.md"; drv = pkgs.writeText "README.md" README; }
    ];
  };
}
