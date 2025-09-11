{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./config.nix
    ./hyprlock.nix
    ./variables.nix
    ./plugins
    ./wlogout
    inputs.hyprland.homeManagerModules.default
  ];
}