{ pkgs, ... }:
{
  security.rtkit.enable = true;
  security.sudo.enable = true;

  # PAM for locks
  security.pam.services.swaylock = {};
  security.pam.services.hyprlock = {};

  # Keyring unlock on login/Hyprland/greetd
  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.hyprland.enableGnomeKeyring = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
}