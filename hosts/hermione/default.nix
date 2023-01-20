{ inputs }:
    let
        system = "aarch64-darwin";
    in
    inputs.darwin.lib.darwinSystem
    {
        inherit system;
        modules = [ 
            ../../shared/default.nix
            ../../shared/darwin.nix
            ../../shared/packages.nix
            ./emacs.nix
            ./ipfs.nix

            inputs.home-manager.darwinModules.home-manager
            ({ config, pkgs, lib, ... }:
                let 
                    username = "jack";
                in
                {
                    nixpkgs.config.allowUnfree = true;

                    networking.hostName = "hermione";

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

                    # Nix-darwin does not link installed applications to the user environment. This means apps will not show up
                    # in spotlight, and when launched through the dock they come with a terminal window. This is a workaround.
                    # Upstream issue: https://github.com/LnL7/nix-darwin/issues/214
                    # Source: https://github.com/Sciencentistguy/nixfiles/blob/master/discordia/mac-apps.nix
                    system.activationScripts.applications.text = let
                    env = pkgs.buildEnv {
                        name = "system-applications";
                        paths = config.environment.systemPackages;
                        pathsToLink = "/Applications";
                    };
                    in
                    lib.mkForce ''
                        # Set up applications.
                        echo "setting up /Applications..." >&2
                        rm -rf /Applications/Nix\ Apps
                        mkdir -p /Applications/Nix\ Apps
                        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
                            while read src; do
                            cp -aL "$src" /Applications/Nix\ Apps
                            done
                    '';

                    # see: https://nix-community.github.io/home-manager/options.html#opt-programs.zsh.enableCompletion
                    environment.pathsToLink = [ "/share/zsh" ];
                }
            )
        ];
    }