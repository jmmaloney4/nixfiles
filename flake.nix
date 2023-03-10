{
    description = "NixOS, nix-darwin, and home-manager configurations.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        darwin = {
            url = "github:lnl7/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = github:nix-community/home-manager;
            inputs.nixpkgs.follows = "nixpkgs";
        };

        vscode-extensions = {
            url = github:nix-community/nix-vscode-extensions;
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # spacemacs = {
        #     url = github:syl20bnr/spacemacs;
        #     flake = false;
        # };

        nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    };

    outputs = inputs @ { self, darwin, nixpkgs, home-manager, vscode-extensions, nix-doom-emacs }:
        rec {
            darwinConfigurations = {
                hermione = import ./hosts/hermione/default.nix {
                    inherit inputs;
                    system = "aarch64-darwin";
                };

                hermione-x86 = import ./hosts/hermione/default.nix {
                    inherit inputs;
                    system = "x86_64-darwin";
                };
            };

            nixosConfigurations = {
                gilderoy = import ./hosts/gilderoy/default.nix {
                    inherit inputs;
                };
            };

            homeConfigurations = {
                jack = import ./home.nix {
                    inherit inputs;
                };
            };

            packages.aarch64-darwin.default = darwinConfigurations.hermione.system;
        };
}
