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
        onActivation = {
            cleanup = "zap";
            upgrade = true;
        };
        casks = [
            "1password"
            "anki"
            "calibre"
            "firefox"
            "flux"
            "mullvadvpn"
            "obsidian"
            "roon"
            "todoist"
            "zotero"
        ];
        taps = [
            "homebrew/cask"
        ];
        masApps = {
            Magnet = 441258766;
            Amphetamine = 937984704;
        };
    };
}
