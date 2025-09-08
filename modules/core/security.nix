{ pkgs, ... }:
{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.swaylock = { };
  security.pam.services.hyprlock = { };

  environment.systemPackages = with pkgs; [   cacert ];
}