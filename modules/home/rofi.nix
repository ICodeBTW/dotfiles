{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi-wayland ];

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
      bg-col:        #1E2330;
      bg-col-light:  #2C3445;
      border-col:    #9B6B43;
      selected-col:  #2C3445;
      pink:          #F4A9C6;
      light-pink:    #FFD1DC;
      green:         #8FBF8F;
      blue:          #87C3E8;
      fg-col:        #F8F8F2;
      fg-col2:       @light-pink;
      grey:          #BDAE93;
      highlight:     @pink;
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration{
      modi: "run,drun,window";
      lines: 5;
      cycle: false;
      font: "Maple Mono Bold 16";
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
      sidebar-mode: true;
      sorting-method: "fzf";
    }

    @theme "theme"

    element-text, element-icon , mode-switcher {
      background-color: inherit;
      text-color: inherit;
    }

    window {
      height: 530px;
      width: 400px;
      border: 2px;
      border-color: @border-col;
      background-color: @bg-col;
    }

    mainbox {
      background-color: @bg-col;
    }

    inputbar {
      children: [prompt,entry];
      background-color: @bg-col-light;
      border-radius: 8px;
      padding: 0px;
    }

    prompt {
      background-color: @pink;
      padding: 4px;
      text-color: @bg-col;
      border-radius: 5px;
      margin: 10px 0px 10px 10px;
    }

    textbox-prompt-colon {
      expand: false;
      str: ":";
    }

    entry {
      padding: 6px;
      margin: 10px 10px 10px 5px;
      text-color: @fg-col;
      background-color: @bg-col;
      border-radius: 5px;
    }

    listview {
      border: 0px;
      padding: 6px 0px 0px;
      margin: 10px 0px 0px 6px;
      columns: 1;
      background-color: @bg-col;
      cycle: true;
    }

    element {
      padding: 8px;
      margin: 0px 10px 4px 4px;
      background-color: @bg-col;
      text-color: @fg-col;
    }

    element-icon {
      size: 28px;
    }

    element selected {
      background-color: @selected-col;
      text-color: @fg-col2;
      border-radius: 5px;
    }

    mode-switcher {
      spacing: 0;
    }

    button {
      padding: 10px;
      background-color: @bg-col-light;
      text-color: @grey;
      vertical-align: 0.5;
      horizontal-align: 0.5;
    }

    button selected {
      background-color: @bg-col;
      text-color: @pink;
    }
  '';
}
