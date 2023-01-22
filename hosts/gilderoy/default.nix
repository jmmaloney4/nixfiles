{ inputs }:
let
  system = "x86_64-linux";
in inputs.nixpkgs.lib.nixosSystem
{
  inherit system;
  modules = [];
}
