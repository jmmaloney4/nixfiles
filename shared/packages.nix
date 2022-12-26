{config, pkgs, lib, ...}:
{
    environment.systemPackages = lib.attrValues ({
        inherit (pkgs) 
        wezterm;
        
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
    } // lib.optionalAttrs pkgs.stdenv.isLinux {
        inherit (pkgs)
        _1password-gui 
        firefox;
    });

    homebrew = {
        enable = pkgs.stdenv.isDarwin;
        casks = [
            "1password"
            "firefox"
        ];
    };
}
