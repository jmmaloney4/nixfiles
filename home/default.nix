{ lib, pkgs, ... }:
{
    programs.home-manager.enable = true;
    home.packages = lib.attrValues ({
        inherit (pkgs)
        _1password
        _1password-gui;
    });
    
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