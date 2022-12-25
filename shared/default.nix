{ config, pkgs, ... }:
{
    # Enable Nix
    services.nix-daemon.enable = true;
    nix.package = pkgs.nix;
    nix.gc.automatic = true;
    nix.configureBuildUsers = true;
    nix.nrBuildUsers = 16;
    nix.extraOptions = ''
        experimental-features = nix-command flakes
    '';

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