{ config, lib, pkgs, inputs, system, ... }:
{
    programs.home-manager.enable = true;
    home.packages = lib.attrValues ({
        inherit (pkgs)
        _1password
        curl
        fd
        ocrmypdf
        ripgrep
        wget

        # k8s
        kubernetes-helm
        kubectl
        sops

        # Rust
        rustup
        # cargo
        # rustfmt
        rust-analyzer
        libiconv

        # Lean Theorem Prover
        # elan
        ;

        vscode = (inputs.vscode-extensions.packages.${system}.vscodium-with-extensions.override {
            vscodeExtensions = with inputs.vscode-extensions.extensions.${system}.vscode-marketplace; [
                bbenoist.nix
                ionide.ionide-fsharp
                eamodio.gitlens
                # GitHub.copilot
                golang.go
                haskell.haskell
                ionide.ionide-fsharp
                james-yu.latex-workshop
                justusadam.language-haskell 
                jnoortheen.nix-ide
                leanprover.lean4
                # matklad.rust-analyzer
                mattn.lisp
                ms-python.python
                ms-toolsai.jupyter
                redhat.vscode-yaml
                streetsidesoftware.code-spell-checker
                znck.grammarly
            ] ++ [
                pkgs.vscode-extensions.github.copilot
                pkgs.vscode-extensions.matklad.rust-analyzer
            ];
        });
    }) ++ [
        pkgs.ghc
        pkgs.haskellPackages.cabal-install
    ];

    home.sessionVariables = {
        EDITOR = "emacs";
    };

    home.shellAliases = {
        e = "emacs";
        code = "codium";
    };

    programs.zoxide.enable = true;
    
    programs.fzf.enable = true;
    programs.fzf.enableZshIntegration = true;

    programs.gh.enable = true;
    programs.gh.settings.git_protocol = "ssh";

    programs.himalaya.enable = true;

    programs.jq.enable = true;

    # programs.sagemath.enable = true;

    programs.zsh.enable = true;
    programs.zsh.enableAutosuggestions = true;
    programs.zsh.enableCompletion = true;
    programs.zsh.enableSyntaxHighlighting = true;
    programs.zsh.history.extended = true;
    programs.zsh.historySubstringSearch.enable = true;

    programs.ssh.enable = true;
    programs.ssh.extraConfig = ''
        Host *
	        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';

    programs.gpg.enable = true;

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
