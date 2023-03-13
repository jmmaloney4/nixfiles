{config, pkgs, lib, ...}:
{
    environment.systemPackages = lib.attrValues ({
        inherit (pkgs)
        anki-bin
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
            "calibre"
            "discord"
            "docker"
            "firefox"
            "flux"
            "mullvadvpn"
            "obsidian"
            "qobuz"
            "roon"
            "slack"
            "todoist"
            "transmission"
            "zoom"
            "zotero"
        ];
        taps = [
            "homebrew/cask"
        ];
        masApps = {
            Amphetamine = 937984704;
            Highlights = 1498912833;
            Magnet = 441258766;
            Tot = 1491071483;
        };
    };
}
