{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab.writers.lib) writeShellApplication;
  inherit (inputs) self std nixpkgs;
in {
  mkdoc = cell.lib.orgToHugo "${(std.incl self ["docs"])}/docs/org";

  auto-commit-infra = cell.lib.mkAutoCommit "infra" "origin HEAD:DeSci";
}