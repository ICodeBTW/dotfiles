{
  config,
  inputs,
  pkgs,
  lib,
  host,
  stylix,
  ...
}:

let
  c = config.lib.stylix.colors; # Base16 palette (hex without #)
  wallpaper = config.stylix.image;
  h = c.withHashtag; # Same palette with leading #

  forcedBackground = lib.mkForce [
    {
      monitor = "";
      path = "${wallpaper}";
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
      color = "${h.base02}";
      rounding = 10;
      border_color = "${h.base07}";
      position = "0, ${if host == "laptop" then "120" else "270"}";
      halign = "center";
      valign = "bottom";
    }
  ];

  forcedLabel = lib.mkForce [
    {
      monitor = "";
      text = ''cmd[update:1000] echo "$(date +'%k:%M')"'';
      color = "${h.base05}";
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
      color = "${h.base05}";
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
      color = "${h.base05}";
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
      outer_color = "${h.base02}";
      inner_color = "${h.base02}";
      color = "${h.base05}";
      font_color = "${h.base05}";
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
