{ config, lib, pkgs, ... }:

let
  cfg = config.modules.core.greeter;
  
  # Import the theme derivation
  hyprlock-inspired-theme = pkgs.callPackage ./themes/hyprlock-inspired { };
in
{
  imports = [
    ./greeter.nix
  ];

  options.modules.core.greeter = {
    enable = lib.mkEnableOption "SDDM greeter configuration";
    
    theme = lib.mkOption {
      type = lib.types.str;
      default = "hyprlock-inspired";
      description = "SDDM theme to use";
    };
  };

  config = lib.mkIf cfg.enable {
    # Install the theme package
    environment.systemPackages = [
      hyprlock-inspired-theme
    ];
    
    # Configure SDDM to use the theme
    services.xserver.displayManager.sddm = {
      enable = true;
      theme = cfg.theme;
      
      # Additional SDDM configuration if needed
      settings = {
        Theme = {
          Current = cfg.theme;
          ThemeDir = "/run/current-system/sw/share/sddm/themes";
        };
      };
    };
  };
}