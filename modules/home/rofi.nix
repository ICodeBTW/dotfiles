{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi ];

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
      bg-col:        rgba(30, 35, 48, 0.6);   /* semi-transparent background */
      bg-col-light:  rgba(44, 52, 69, 0.5);
      border-col:    rgba(135, 195, 232, 0.7); /* soft blue border */
      selected-col:  rgba(135, 195, 232, 0.25);
      accent-blue:   #87C3E8;
      accent-glow:   #A3DAFF;
      fg-col:        #E6F0FA;
      fg-col2:       @accent-blue;
      grey:          #C0C0C0;
      highlight:     @accent-glow;
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      modi: "run,drun,window";
      lines: 6;
      cycle: false;
      font: "SF Pro Display 15";
      show-icons: true;
      icon-theme: "Papirus-dark";
      terminal: "ghostty";
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
  children: [entry];   /* remove prompt */
  background-color: @bg-col-light;
  border-radius: 15px;
  padding: 8px;
  margin: 10px 0px 20px;
}
entry {
  padding: 6px;
  margin: 10px 10px 10px 5px;
  text-color: @fg-col;
  background-color: rgba(255, 255, 255, 0.05);  /* subtle glass effect */
  border-radius: 6px;
}

  element {
  padding: 10px;
  margin: 4px 6px;
  border-radius: 12px;
  background-color: transparent;   /* no white boxes */
  text-color: @fg-col;
}

element-text, element-icon {
  background-color: transparent;   /* kill the white fill */
  text-color: inherit;
}

element selected {
  background-color: rgba(135, 195, 232, 0.15); /* subtle blue tint */
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
