{ inputs }:
    inputs.darwin.lib.darwinSystem
    {
        system = "aarch64-darwin";
        # specialArgs = { inherit lib pkgs inputs self darwin; };
        modules = [ ../../shared/defaults.nix ../../shared/nix.nix ];
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