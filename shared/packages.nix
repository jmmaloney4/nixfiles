{config, pkgs, lib, ...}:
{
    environment.systemPackages = lib.attrValues ({
        inherit (pkgs) 
        wezterm 
        _1password-gui;
        
        vscode = (pkgs.vscode-with-extensions.override {
            vscode = pkgs.vscodium;
            vscodeExtensions = with pkgs.vscode-extensions; [
                # bbenoist.nix
                eamodio.gitlens
                golang.go         
                james-yu.latex-workshop  
                jnoortheen.nix-ide
                matklad.rust-analyzer
                # ms-python.python
                ms-toolsai.jupyter
                redhat.vscode-yaml
                # juanblanco.solidity
                justusadam.language-haskell
                haskell.haskell
            ];
        });
    } // lib.optionalAttrs pkgs.stdenv.isLinux {
        inherit (pkgs) firefox;
    });

    homebrew = {
        enable = pkgs.stdenv.isDarwin;
        casks = [ "firefox" ];
    };
}
