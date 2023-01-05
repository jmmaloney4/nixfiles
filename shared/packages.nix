{config, pkgs, lib, ...}:
{
    environment.systemPackages = lib.attrValues ({
        inherit (pkgs)
        git
        git-annex
        # transmission-qt
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
            "docker"
            "firefox"
            "flux"
            "mullvadvpn"
            "obsidian"
            "roon"
            "todoist"
            "transmission"
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
