{ inputs }:
let
  system = "x86_64-linux";
in inputs.nixpkgs.lib.nixosSystem
{
  inherit system;
  modules = [
    ./hardware-configuration.nix
    ../../shared/default.nix
    ../../shared/packages.nix

    inputs.home-manager.nixosModules.home-manager
    ({ config, pkgs, lib, ... }: inputs.nixpkgs.lib.mkMerge {
      networking.hostName = "gilderoy";
    })
  ];
}
