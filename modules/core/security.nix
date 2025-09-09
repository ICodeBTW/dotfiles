{ pkgs, ... }:
{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  
  # PAM for locks
  security.pam.services.swaylock = {};
  security.pam.services.hyprlock = {};
  
  # Keyring unlock on login - updated for SDDM
  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.hyprland.enableGnomeKeyring = true;
  security.pam.services.sddm.enableGnomeKeyring = true;  # Changed from greetd to sddm
  security.pam.services.sddm-greeter.enableGnomeKeyring = true;  # Additional SDDM service
  
  # Optional: Additional security configurations for better SDDM integration
  security.pam.services.sddm-autologin.enableGnomeKeyring = true;  # If you use autologin
  
  # Enable polkit for better permission handling with SDDM
  security.polkit.enable = true;
 
}