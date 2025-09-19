{ stylix,config, pkgs, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  home.packages = with pkgs; [ rofi ];
  stylix.targets.rofi.enable = true;  # Enable rofi theming

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
      bg-col:        ${colors.base00}cc;   /* semi-transparent background with alpha */
      bg-col-light:  ${colors.base01}cc;
      border-col:    ${colors.base0D}cc;   /* using stylix accent blue */
      selected-col:  ${colors.base0D}40;
      accent-blue:   ${colors.base0D};
      accent-glow:   ${colors.base06};
      fg-col:        ${colors.base05};
      fg-col2:       ${colors.base0D};
      grey:          ${colors.base07};
      highlight:     ${colors.base06};
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      modi: "run,drun,window";
      lines: 6;
      cycle: false;
      font: "SF Pro Display 15";
      show-icons: true;
      terminal: "alacritty";
      drun-display-format: "{icon} {name}";
      location: 0;
      disable-history: true;
      hide-scrollbar: true;
      display-drun: " Apps ";
      display-run: " Run ";
      display-window: " Window ";
      sidebar-mode: false;
      sorting-method: "fzf";
    }

    @theme "theme"
    window {
      width: 768px;
      height: 560px;
      border: 2px;
      border-radius: 20px;
      border-color: @border-col;
      background-color: @bg-col;
    }

    mainbox {
      background-color: transparent;
      padding: 20px;
    }

    inputbar {
      children: [entry];
      background-color: @bg-col-light;
      border-radius: 15px;
      padding: 8px;
      margin: 10px 0px 20px;
    }
    entry {
      padding: 6px;
      margin: 10px 10px 10px 5px;
      text-color: @fg-col;
      background-color: rgba(255, 255, 255, 0.05);
      border-radius: 6px;
    }

    element {
      padding: 10px;
      margin: 4px 6px;
      border-radius: 12px;
      background-color: transparent;
      text-color: @fg-col;
    }

    element-text, element-icon {
      background-color: transparent;
      text-color: inherit;
    }

    element selected {
      background-color: rgba(135, 195, 232, 0.15);
      text-color: @accent-blue;
      border: 1px;
      border-color: @accent-glow;
      border-radius: 12px;
    }

    element-icon {
      size: 28px;
    }

    listview {
      columns: 1;
      spacing: 8px;
      margin: 10px 0px;
      background-color: transparent;
    }

    button {
      padding: 10px;
      border-radius: 10px;
      background-color: @bg-col-light;
      text-color: @grey;
    }

    button selected {
      background-color: @selected-col;
      text-color: @accent-blue;
    }
  '';
}
