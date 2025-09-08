{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ gnome-keyring seahorse ];

  services.gnome-keyring.enable = true;
  services.gnome-keyring.components = [ "secrets" "ssh" ];
}
