{config, pkgs, ...}:
{
  services.emacs.enable = true;
  services.emacs.package = pkgs.emacs-nox;
}