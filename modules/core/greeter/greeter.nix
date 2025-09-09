# modules/core/greeter/greeter.nix
{ config, lib, pkgs, ... }:

let
  cfg = config.modules.core.greeter;
in
{
  config = lib.mkIf cfg.enable {
    # SDDM service configuration
    services.xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;  # Enable if using Wayland
        
        # Theme-specific settings
        settings = {
          General = {
            HaltCommand = "/run/current-system/sw/bin/systemctl poweroff";
            RebootCommand = "/run/current-system/sw/bin/systemctl reboot";
            Numlock = "on";
          };
          
          Users = {
            MaximumUid = 60000;
            MinimumUid = 1000;
            HideUsers = "";
            HideShells = "/bin/false,/usr/bin/nologin,/sbin/nologin";
          };
        };
      };
    };

    # Ensure required packages for themes are available
    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.sddm-kcm
    ];

    # Font configuration for better theme rendering
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
    ];
  };
}
  # # Symlink central wallpapers
  # environment.etc."sddm/wallpapers/wallpaper.jpeg".source =
  #   ../../../wallpapers/wallpaper.jpeg;
