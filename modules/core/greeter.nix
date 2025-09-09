# modules/core/greeter.nix
{ config, pkgs, lib, ... }:

let
  andromeda-sddm = pkgs.callPackage ./themes/andromeda-sddm.nix { };
in
{
  environment.systemPackages = [
    andromeda-sddm
    pkgs.kdePackages.qtmultimedia
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "Andromeda";
  };
}
