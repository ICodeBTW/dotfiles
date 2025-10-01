{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./config.nix
    ./hyprlock.nix
    ./variables.nix
    ./wlogout.nix
    ./plugins
    inputs.hyprland.homeManagerModules.default
  ];
}