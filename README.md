# Nix Dotfiles

`hosts/` contains the NixOS/nix-darwin configuration for each host.
`home/` contains home-manager configuration for my user.

```shell
darwin-rebuild switch --flake '.#hermione'
```