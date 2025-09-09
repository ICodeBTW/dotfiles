 # minimal SDDM greeter (baseline)
{
  services.displayManager.sddm = {
    enable = true;             # turn on SDDM
    # theme = "breeze";        # optional: set a theme name later
    wayland.enable = true;    
  };
}
