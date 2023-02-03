{ config, pkgs, ... }:
let
    substituters = [
        # Binary Cache for Haskell.nix
        "https://cache.iog.io"
        "https://cache.zw3rk.com"
        
        # Lean4 Theorem Prover
        "https://lean4.cachix.org/"

        # nix-community
        "https://nix-community.cachix.org"
    ];
in
{
    # Enable Nix
    services.nix-daemon.enable = true;
    nix.package = pkgs.nix;
    nix.gc.automatic = true;
    nix.configureBuildUsers = true;
    nix.nrBuildUsers = 16;
    nix.extraOptions = ''
        experimental-features = nix-command flakes
        max-jobs = auto
    '';
    
    nix.settings.trusted-public-keys = [
        # Binary Cache for Haskell.nix
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
        "loony-tools:pr9m4BkM/5/eSTZlkQyRt57Jz7OMBxNSUiMC4FkcNfk="
        
        # Lean4 Theorem Prover
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "lean4.cachix.org-1:mawtxSxcaiWE24xCXXgh3qnvlTkyU7evRRnGeAhD4Wk="

        # nix-community
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    nix.settings.substituters = substituters;
    nix.settings.trusted-substituters = substituters;

    # Enable ZSH
    programs.zsh.enable = true;
    programs.zsh.enableBashCompletion = true;
    programs.zsh.enableFzfCompletion = true;
    programs.zsh.enableFzfGit = true;
    programs.zsh.enableFzfHistory = true;
    
    environment.loginShell = "${pkgs.zsh}/bin/zsh -l";
    environment.variables.SHELL = "${pkgs.zsh}/bin/zsh";
    environment.variables.LANG = "en_US.UTF-8";

    # Sudo TouchID
    security.pam.enableSudoTouchIdAuth = true;

    # Fonts
    fonts = {
        fontDir.enable = true;
        fonts = [ (pkgs.nerdfonts.override { fonts = [ "DaddyTimeMono" ]; }) 
                pkgs.source-serif-pro
                pkgs.ia-writer-duospace
                ];
    };
    
}