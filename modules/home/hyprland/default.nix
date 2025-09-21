{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./config.nix
    ./hyprlock.nix
    ./variables.nix
    ./wlogout.nix
    # ./plugins #Conflict
    inputs.hyprland.homeManagerModules.default
  ];
}