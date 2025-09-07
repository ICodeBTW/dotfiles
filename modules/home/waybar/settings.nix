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
    opacity = "1";
    indicator_height = "2px";
  };
in
{
  programs.waybar.settings.mainBar = with custom; {
    position = "top";
    layer = "top";
    height = 28;

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
      calendar.format.today = "<span color='${pink}'><b>{}</b></span>";
      format = "<span foreground='${light_pink}'></span> {:%H:%M}";
      tooltip = true;
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "<span foreground='${pink}'></span> {:%d/%m}";
    };

    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "<span foreground='${pink}'>I</span>";
        "2" = "<span foreground='${pink}'>II</span>";
        "3" = "<span foreground='${pink}'>III</span>";
        "4" = "<span foreground='${pink}'>IV</span>";
        "5" = "<span foreground='${pink}'>V</span>";
        "6" = "<span foreground='${pink}'>VI</span>";
        "7" = "<span foreground='${pink}'>VII</span>";
        "8" = "<span foreground='${pink}'>VIII</span>";
        "9" = "<span foreground='${pink}'>IX</span>";
        "10" = "<span foreground='${pink}'>X</span>";
        sort-by-number = true;
      };
      persistent-workspaces."1" = [ ];
      persistent-workspaces."2" = [ ];
      persistent-workspaces."3" = [ ];
      persistent-workspaces."4" = [ ];
      persistent-workspaces."5" = [ ];
    };

    cpu = {
      format = "<span foreground='${green}'></span> {usage}%";
      format-alt = "<span foreground='${green}'></span> {avg_frequency} GHz";
    };

    memory = {
      format = "<span foreground='${blue}'>󰟜</span> {}%";
      format-alt = "<span foreground='${blue}'>󰟜</span> {used} GiB";
    };

    disk = {
      format = "<span foreground='${border_color}'>󰋊</span> {percentage_used}%";
    };

    network = {
      format-wifi = "<span foreground='${pink}'></span> {signalStrength}%";
      format-ethernet = "<span foreground='${pink}'>󰀂</span>";
      format-disconnected = "<span foreground='${pink}'>󰖪</span>";
    };

    pulseaudio = {
      format = "<span foreground='${blue}'>{icon}</span> {volume}%";
      format-muted = "<span foreground='${blue}'></span> {volume}%";
      format-icons.default = [ "" ];
    };

    battery = {
      format = "<span foreground='${light_pink}'>{icon}</span> {capacity}%";
      format-charging = "<span foreground='${light_pink}'></span> {capacity}%";
      format-full = "<span foreground='${light_pink}'></span> {capacity}%";
      format-warning = "<span foreground='${border_color}'></span> {capacity}%";
    };

    "hyprland/language" = {
      format = "<span foreground='${blue}'></span> {}";
    };

    "custom/launcher" = {
      format = "<span foreground='${pink}'></span>";
    };

    "custom/notification" = {
      format-icons = {
        notification = "<span foreground='${pink}'></span>";
        none = "<span foreground='${pink}'></span>";
      };
    };
  };
}
