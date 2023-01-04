{ lib, pkgs, ... }:
{
    programs.home-manager.enable = true;
    home.packages = lib.attrValues ({
        inherit (pkgs)
        _1password
        fd
        ocrmypdf
        ripgrep
        ;

        vscode = (pkgs.vscode-with-extensions.override {
            vscode = pkgs.vscodium;
            vscodeExtensions = with pkgs.vscode-extensions; [
                bbenoist.nix
                ionide.ionide-fsharp
                eamodio.gitlens
                github.copilot
                golang.go
                haskell.haskell
                ionide.ionide-fsharp
                james-yu.latex-workshop
                justusadam.language-haskell 
                jnoortheen.nix-ide
                matklad.rust-analyzer
                ms-python.python
                ms-toolsai.jupyter
                redhat.vscode-yaml
            ];
        });
    }) ++ [
        pkgs.ghc
        pkgs.haskellPackages.cabal-install
    ];
    
    programs.zoxide.enable = true;
    
    programs.fzf.enable = true;
    programs.fzf.enableZshIntegration = true;

    programs.gh.enable = true;

    programs.himalaya.enable = true;

    programs.jq.enable = true;

    # programs.sagemath.enable = true;

    programs.zsh.enable = true;
    programs.zsh.enableAutosuggestions = true;
    programs.zsh.enableCompletion = true;
    programs.zsh.enableSyntaxHighlighting = true;
    programs.zsh.history.extended = true;
    programs.zsh.historySubstringSearch.enable = true;
    programs.zsh.shellAliases = {
        code = "codium";
    };

    programs.ssh.enable = true;
    programs.ssh.extraConfig = ''
        Host *
	        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';

    programs.bat.enable = true;
    programs.bat.config.pager = "${pkgs.less}/bin/less -FR";

    programs.exa.enable = true;
    programs.exa.enableAliases = true;

    programs.wezterm.enable = true;
    programs.wezterm.extraConfig = ''
        local wezterm = require 'wezterm';
        return {
        font = wezterm.font("DaddyTimeMono Nerd Font Mono"),
        font_size = 15.0,
        -- color_scheme = "Builtin Solarized Light",
        color_scheme = "Builtin Pastel Dark",
        -- color_scheme = "Belafonte Day",
        scrollback_lines = 10000,
        }
    '';
}