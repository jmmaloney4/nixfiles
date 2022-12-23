{
    description = "NixOS, nix-darwin, and home-manager configurations.";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";

        darwin = {
            url = "github:lnl7/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = github:nix-community/home-manager;
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs @ { self, darwin, nixpkgs, home-manager }:
        {
            darwinConfigurations = {
                hermione = import ./hosts/hermione/default.nix {
                    inherit inputs;
                };
            };
        };
}