# global style 
  # /* Fonts: can be driven by Stylix targets; override here if desired */
  # font-family: Maple Mono;
  # font-weight: bold;
  # opacity: 1;
  # font-size: 18px;



{ config, ... }:
let
  c = config.lib.stylix.colors;          # hex without # [web:22]
  h = c.withHashtag;                      # hex with #     [web:22]
in
{
  programs.waybar.style = ''
* {
  border: none;
  border-radius: 0px;
  padding: 0;
  margin: 0;
  font-size: 18px;
  font-weight: bold;
}

window#waybar {
  background-color: ${h.base00};
  border-top: 1px solid ${h.base02};
  color: ${h.base05};
}

tooltip {
  background-color: ${h.base01};
  border: 1px solid ${h.base02};
}
tooltip label {
  margin: 5px;
  color: ${h.base05};
}

/* Hyprland workspaces */
#workspaces {
  padding-left: 15px;
}
#workspaces button {
  color: ${h.base0A}; /* yellow accent */ 
  padding-left: 5px;
  padding-right: 5px;
  margin-right: 10px;
}
#workspaces button.empty {
  color: ${h.base05};
}
#workspaces button.active {
  color: ${h.base09}; /* bright orange accent */
}

/* Clock */
#clock { color: ${h.base05}; }

/* Tray */
#tray {
  margin-left: 10px;
  color: ${h.base05};
}
#tray menu {
  background-color: ${h.base01};
  border: 1px solid ${h.base02};
  padding: 8px;
}
#tray menuitem { padding: 1px; }

/* Right-side metrics and network/audio */
#pulseaudio, #network, #cpu, #memory, #disk, #battery, #language, #custom-notification {
  padding-left: 5px;
  padding-right: 5px;
  margin-right: 10px;
  color: ${h.base05};
  background-color: ${h.base00};
}

/* Spacing adjustments */
#pulseaudio, #language { margin-left: 15px; }

/* Custom notifications */
#custom-notification {
  margin-left: 15px;
  padding-right: 2px;
  margin-right: 5px;
}

/* Custom launcher */
#custom-launcher {
  font-size: 20px;
  color: ${h.base05};
  font-weight: bold;
  margin-left: 15px;
  padding-right: 10px;
}
  '';
}
