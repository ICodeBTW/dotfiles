 # minimal SDDM greeter (baseline)
{
  services.displayManager.sddm = {
    enable = true;             # turn on SDDM
    wayland = true;
    theme = "/etc/sddm/themes/hyprlock-inspired"; # Point to your custom theme directory    wayland.enable = true;    
  };
}