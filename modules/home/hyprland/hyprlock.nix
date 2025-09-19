{ config, inputs, pkgs, lib, host, stylix, ... }:

let
  colors = config.lib.stylix.colors;
  # fonts = config.lib.stylix.fonts;

  forcedBackground = lib.mkForce [
    {
      monitor = "";
      path = "${../../../wallpapers/wallpaper.jpeg}";
      blur_passes = 2;
      contrast = 0.8916;
      brightness = 0.8172;
      vibrancy = 0.1696;
      vibrancy_darkness = 0.0;
    }
  ];

  forcedShape = lib.mkForce [
    {
      monitor = "";
      size = "300, 50";
      color = "${colors.base02}55";
      rounding = 10;
      border_color = "${colors.base07}00";
      position = "0, ${if host == "laptop" then "120" else "270"}";
      halign = "center";
      valign = "bottom";
    }
  ];

  forcedLabel = lib.mkForce [
    {
      monitor = "";
      text = ''cmd[update:1000] echo "$(date +'%k:%M')"'';
      color = "${colors.base05}e6";
      font_size = 115;
      # font_family = "${fonts.sansSerif.name} Bold";
      shadow_passes = 3;
      position = "0, ${if host == "laptop" then "-25" else "-150"}";
      halign = "center";
      valign = "top";
    }
    {
      monitor = "";
      text = ''cmd[update:1000] echo "- $(date +'%A, %B %d') -" '';
      color = "${colors.base05}e6";
      font_size = 18;
      # font_family = "${fonts.sansSerif.name}";
      shadow_passes = 3;
      position = "0, ${if host == "laptop" then "-225" else "-350"}";
      halign = "center";
      valign = "top";
    }
    {
      monitor = "";
      text = "  $USER";
      color = "${colors.base05}ff";
      font_size = 15;
      # font_family = "${fonts.sansSerif.name} Bold";
      position = "0, ${if host == "laptop" then "131" else "281"}";
      halign = "center";
      valign = "bottom";
    }
  ];

  forcedInputField = lib.mkForce [
    {
      monitor = "";
      size = "300, 50";
      outline_thickness = 1;
      rounding = 10;
      dots_size = 0.25;
      dots_spacing = 0.4;
      dots_center = true;
      outer_color = "${colors.base02}55";
      inner_color = "${colors.base02}55";
      color = "${colors.base05}e6";
      font_color = "${colors.base05}e6";
      font_size = 14;
      # font_family = "${fonts.sansSerif.name} Bold";
      fade_on_empty = false;
      placeholder_text = ''Enter Password'';
      hide_input = false;
      position = "0, ${if host == "laptop" then "50" else "200"}";
      halign = "center";
      valign = "bottom";
    }
  ];

in
{
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;

    settings = {
      general = {
        hide_cursor = true;
        no_fade_in = false;
        disable_loading_bar = true;
        ignore_empty_input = true;
        fractional_scaling = 0;
      };

      background = forcedBackground;
      shape = forcedShape;
      label = forcedLabel;
      input-field = forcedInputField;

      # stylix targets
      stylix.targets.hyprlock.enable = true;
      stylix.targets.hyprlock.useWallpaper = true;
    };
  };
}
