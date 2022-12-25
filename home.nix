{ inputs }:
    inputs.home-manager.lib.homeManagerConfiguration
    {
        pkgs = inputs.nixpkgs;
        modules = [
            ./home/default.nix
            ./home/starship.nix
            ./home/git.nix
        ];
    }