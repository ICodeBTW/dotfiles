{ config, host, ... }:
let
  c = config.lib.stylix.colors;          # Base16 palette (hex without #) [web:22]
  h = c.withHashtag;                      # Same palette with leading #      [web:22]
in
{
  programs.waybar.settings.mainBar = {
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
      "disk"
      "pulseaudio"
      "network"
      "battery"
      "custom/notification"
    ];

    clock = {
      format = "  {:%H:%M %Z}";
      tooltip = "true";
      format-alt = "  {:%d/%m %Z}";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      timezones = [
        "Asia/Kolkata"
        "Europe/London"
        "Australia/Sydney"
        "Asia/Tokyo"
        "America/Los_Angeles"
      ];
      actions = {
        on-scroll-up = "tz_up";
        on-scroll-down = "tz_down";
      };
      interval = 60;
      calendar = {
        format = {
          # Example: highlight “today” using a scheme accent (green-ish base0B)
          today = "<span color='${h.base0B}'><b>{}</b></span>";
        };
      };
    };

    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      on-click = "activate";
      persistent-workspaces = {
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
        "4" = [ ];
        "5" = [ ];
      };
    };

    # CPU: use Base16 accent for the icon color; no hex literals
    cpu = {
      format = "<span color='${h.base0D}'> </span>{usage}%";
      format-alt = "<span color='${h.base0D}'> </span>{avg_frequency} GHz";
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] alacritty --title alacritty --command btop'";
    };

    # Memory: typically green base0B
    memory = {
      format = "<span color='${h.base0B}'>󰟜 </span>{}%";
      format-alt = "<span color='${h.base0B}'>󰟜 </span>{used} GiB";
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] alacritty --title alacritty --command btop'";
    };

    # Disk: orange/yellow accent base0A or base09
    disk = {
      format = "<span color='${h.base09}'>󰋊 </span>{percentage_used}%";
      interval = 60;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] alacritty --title alacritty --command btop'";
    };

    network = {
      format-wifi = "<span color='${h.base0B}'> </span>{signalStrength}%";
      format-ethernet = "<span color='${h.base0B}'>󰀂 </span>";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "<span color='${h.base03}'>󰖪 </span>";
    };

    tray = {
      icon-size = 20;
      spacing = 8;
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "<span color='${h.base0D}'> </span>{volume}%";
      format-icons = {
        default = [ "<span color='${h.base0D}'> </span>" ];
      };
      scroll-step = 2;
      on-click = "pamixer -t";
      on-click-right = "pavucontrol";
    };

    battery = {
      format = "<span color='${h.base0D}'>{icon}</span> {capacity}%";
      format-icons = [ " " " " " " " " " " ];
      format-charging = "<span color='${h.base0D}'> </span>{capacity}%";
      format-full = "<span color='${h.base0D}'> </span>{capacity}%";
      format-warning = "<span color='${h.base08}'> </span>{capacity}%";
      interval = 5;
      states = { warning = 20; };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };

    "custom/launcher" = {
      format = "";
      tooltip = "true";
      tooltip-format = "Random Wallpaper";
    };

    "custom/notification" = {
      tooltip = false;
      format = "{icon} ";
      # Drive all glyph accents from the scheme
      format-icons = {
        notification = "<span color='${h.base09}'><sup></sup></span>  <span color='${h.base09}'></span>";
        none = "  <span color='${h.base09}'></span>";
        dnd-notification = "<span color='${h.base09}'><sup></sup></span>  <span color='${h.base09}'></span>";
        dnd-none = "  <span color='${h.base09}'></span>";
        inhibited-notification = "<span color='${h.base09}'><sup></sup></span>  <span color='${h.base09}'></span>";
        inhibited-none = "  <span color='${h.base09}'></span>";
        dnd-inhibited-notification = "<span color='${h.base09}'><sup></sup></span>  <span color='${h.base09}'></span>";
        dnd-inhibited-none = "  <span color='${h.base09}'></span>";
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
