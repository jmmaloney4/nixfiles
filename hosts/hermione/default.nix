{ inputs }:
    inputs.darwin.lib.darwinSystem
    {
        system = "aarch64-darwin";
        modules = [ 
            ../../shared/default.nix
            ../../shared/darwin.nix

            inputs.home-manager.darwinModules.home-manager
            ({...}:
                let 
                    username = "jack";
                in
                {
                    users.users.${username}.home = "/Users/${username}";
                    # nix.nixPath.nixpkgs = "${inputs.nixpkgs-unstable}";
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.${username} = {
                        imports = [
                            ../../home/default.nix
                            ../../home/starship.nix
                        ];
                        home.stateVersion = "22.11";
                    };
                }
            )
        ];
    }

# { pkgs, inputs, lib, ... }:
# with lib;
# {
#     programs.zsh.enable = true;
#     programs.zsh.enableBashCompletion = true;
#     programs.zsh.enableFzfCompletion = true;
#     programs.zsh.enableFzfGit = true;
#     programs.zsh.enableFzfHistory = true;

#     environment.loginShell = "${pkgs.zsh}/bin/zsh -l";
#     environment.variables.SHELL = "${pkgs.zsh}/bin/zsh";
#     environment.variables.LANG = "en_US.UTF-8";

#     services.nix-daemon.enable = true;
#     nix.package = pkgs.nixVersions.stable;
#     nix.settings.cores = 0; # use all cores
#     nix.gc.automatic = true;
#     nix.extraOptions = ''
#         experimental-features = nix-command flakes
#     '';

#     security.pam.enableSudoTouchIdAuth = true;

#     system.defaults = {
#     };

#     users.users.jack = {
#         name = "jack";
#         home = "/Users/${name}";
#     };
#     homebrew = {
#         enable = true;
#         casks = [
#             "vlc"
#         ];
#     };
# }