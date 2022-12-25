{ lib, pkgs, ... }:
{
    programs.home-manager.enable = true;
    home.packages = lib.attrValues ({
        inherit (pkgs)
        _1password
        _1password-gui;
    });

}