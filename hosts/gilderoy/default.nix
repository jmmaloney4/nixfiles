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
    ({ config, pkgs, lib, ... }:
    let
        username = "jack";
    in
    {
        nixpkgs.config.allowUnfree = true;

        networking.hostName = "gilderoy";

        users.users.${username}.home = "/Users/${username}";
        # nix.nixPath.nixpkgs = "${inputs.nixpkgs-unstable}";
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit inputs system; };
        home-manager.users.${username} = {
            imports = [
                ../../home/default.nix
                ../../home/git.nix
                ../../home/starship.nix
                inputs.nix-doom-emacs.hmModule
            ];
            home.stateVersion = "22.11";
            programs.doom-emacs = {
                enable = true;
                doomPrivateDir = ../../doom.d;
                emacsPackage = pkgs.emacs-nox;
            };
        };

        # see: https://nix-community.github.io/home-manager/options.html#opt-programs.zsh.enableCompletion
        environment.pathsToLink = [ "/share/zsh" ];
    })

    ({ config, pkgs, lib, ... }: inputs.nixpkgs.lib.mkMerge [{
      networking.hostName = "gilderoy";
    }])
  ];
}
