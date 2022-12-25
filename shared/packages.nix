{config, pkgs, lib, ...}:
{
    environment.systemPackages = lib.attrValues ({
        inherit (pkgs) wezterm;
    } // lib.optionalAttrs pkgs.stdenv.isLinux {
        inherit (pkgs) firefox;
    });

    homebrew = {
        enable = pkgs.stdenv.isDarwin;
        casks = [ "firefox" ];
    };
}