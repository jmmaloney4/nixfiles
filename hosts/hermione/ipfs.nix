{ config, pkgs, ...}:
{
  environment.systemPackages = [ pkgs.ipfs ];
  launchd.user.agents.ipfs = {
    command = with pkgs; "${ipfs}/bin/ipfs daemon --init";
    path = with pkgs; [ config.nix.package git gnutar gzip ];
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      ProcessType = "Background";
      # StandardOutPath = cfg.logFile;
      # StandardErrorPath = cfg.logFile;
      EnvironmentVariables = { NIX_PATH = "nixpkgs=" + toString pkgs.path; };
    };
  };
}