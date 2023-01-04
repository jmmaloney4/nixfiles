{config, pkgs, lib, ...}:
{
    environment.systemPackages = lib.attrValues ({
        inherit (pkgs) 
        wezterm;
    } // lib.optionalAttrs pkgs.stdenv.isLinux {
        inherit (pkgs)
        _1password-gui
        calibre
        firefox
        obsidian
        zotero;
    });
 
   homebrew = {
        enable = pkgs.stdenv.isDarwin;
        casks = [
            "1password"
            "calibre"
            "firefox"
            "obsidian"
            "roon"
            "zotero"
        ];
    };
}
