{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    # Call the theme derivation
    package = pkgs.callPackage ./themes/hyprlock-inspired { };
    theme = "hyprlock-inspired";
  };

  fonts.packages = with pkgs; [
    maple-mono.NF
  ];

  # Symlink central wallpapers
  environment.etc."sddm/wallpapers/wallpaper.jpeg".source =
    ../../../wallpapers/wallpaper.jpeg;
}
