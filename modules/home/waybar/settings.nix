{ host, ... }:
let
  custom = {
   font = "Maple Mono";
    font_size = "18px";
    font_weight = "bold";
    text_color = "#F8F8F2";       # light text
    background_0 = "#1E2330";     # dark bg
    background_1 = "#2C3445";     # slightly lighter bg
    border_color = "#9B6B43";     # warm brown
    pink = "#F4A9C6";             # sakura pink
    light_pink = "#FFD1DC";       # light petals
    blue = "#87C3E8";             # sky blue
    green = "#8FBF8F";            # leaves
    cyan = "#689D6A"; 
    orange = "#D65D0E";
    opacity = "1";
    indicator_height = "2px";
  };
in
{
  programs.waybar.settings.mainBar = with custom; {
    position = "top";
    layer = "top";
    height = 28;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
      "tray"
    ];
    modules-center = [ "clock" ];
    modules-right = [
      "cpu"
      "memory"
      (if (host == "desktop") then "disk" else "")
      "pulseaudio"
      "network"
      "battery"
      "hyprland/language"
      "custom/notification"
    ];
    clock = {
      calendar = {
        format = {
          today = "<span color='#98971A'><b>{}</b></span>";
        };
      };
      format = "  {:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "  {:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "I";
        "2" = "II";
        "3" = "III";
        "4" = "IV";
        "5" = "V";
        "6" = "VI";
        "7" = "VII";
        "8" = "VIII";
        "9" = "IX";
        "10" = "X";
        sort-by-number = true;
      };
      persistent-workspaces = {
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
        "4" = [ ];
        "5" = [ ];
      };
    };
    cpu = {
      format = "<span foreground='${light_pink}'> </span> {usage}%";
      format-alt = "<span foreground='${light_pink}'> </span> {avg_frequency} GHz";
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    memory = {
      format = "<span foreground='${green}'>󰟜 </span>{}%";
      format-alt = "<span foreground='${green}'>󰟜 </span>{used} GiB"; # 
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    disk = {
      # path = "/";
      format = "<span foreground='${orange}'>󰋊 </span>{percentage_used}%";
      interval = 60;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    network = {
      format-wifi = "<span foreground='${green}'> </span> {signalStrength}%";
      format-ethernet = "<span foreground='${green}'>󰀂 </span>";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "<span foreground='${green}'>󰖪 </span>";
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "<span foreground='${blue}'> </span> {volume}%";
      format-icons = {
        default = [ "<span foreground='${blue}'> </span>" ];
      };
      scroll-step = 2;
      on-click = "pamixer -t";
      on-click-right = "pavucontrol";
    };
    battery = {
      format = "<span foreground='${blue}'>{icon}</span> {capacity}%";
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
      format-charging = "<span foreground='${blue}'> </span>{capacity}%";
      format-full = "<span foreground='${blue}'> </span>{capacity}%";
      format-warning = "<span foreground='${blue}'> </span>{capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
    "hyprland/language" = {
      format = "<span foreground='#FABD2F'> </span> {}";
      format-fr = "FR";
      format-en = "US";
      on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
    };
    "custom/launcher" = {
      format = "";
      on-click = "random-wallpaper";
      on-click-right = "rofi -show drun";
      tooltip = "true";
      tooltip-format = "Random Wallpaper";
    };
    "custom/notification" = {
      tooltip = false;
      format = "{icon} ";
      format-icons = {
        notification = "<span foreground='pink'><sup></sup></span>  <span foreground='${pink}'></span>";
        none = "  <span foreground='${pink}'></span>";
        dnd-notification = "<span foreground='pink'><sup></sup></span>  <span foreground='${pink}'></span>";
        dnd-none = "  <span foreground='${pink}'></span>";
        inhibited-notification = "<span foreground='pink'><sup></sup></span>  <span foreground='${pink}'></span>";
        inhibited-none = "  <span foreground='${pink}'></span>";
        dnd-inhibited-notification = "<span foreground='pink'><sup></sup></span>  <span foreground='${pink}'></span>";
        dnd-inhibited-none = "  <span foreground='${pink}'></span>";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };
  };
}