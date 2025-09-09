{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    # Register your theme by name
    themes = [
      {
        name = "hyprlock-inspired";
        path = ./themes/hyprlock-inspired;
      }
    ];

    theme = "hyprlock-inspired";
  };

  # Ensure Maple Mono font is installed
  fonts.packages = with pkgs; [
    maple-mono.NF
  ];

  # Symlink your wallpapers folder into /etc/sddm
  environment.etc."sddm/wallpapers/wallpaper.jpeg".source =
    ../../../wallpapers/wallpaper.jpeg;
}
