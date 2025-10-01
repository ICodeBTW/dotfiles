{ pkgs, config, host, ... }:
let
  c = config.lib.stylix.colors; # Base16 palette (hex without #)
  h = c.withHashtag; # Same palette with leading #

in
{
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 25;
    margin-top = 3;
    width = 1920;

    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
      "custom/media"
      "custom/weather"
    ];

    modules-center = [
      "clock"
    ];

    modules-right = [
      "tray"
      "hyprland/language"
      "pulseaudio"
      "battery"
      "custom/notification"
    ];

    # Custom launcher with archik-dots styling
    "custom/launcher" = {
      format = "󱄅";
      tooltip = false;
      on-click = "rofi -show drun";
    };

    "hyprland/workspaces" = {
      on-click = "activate";
      format = "{icon}";
      format-icons = {
        urgent = "";
        active = "";
        default = "";
      };
    };

    # Window title (archik-dots style)
    "hyprland/window" = {
      format = "{class}";
      separate-outputs = false;
    };

    # Clock with timezone support (keeping your functionality)
    clock = {
      format = "󰥔 {:%H:%M %Z}";
      tooltip = true;
      format-alt = "󰥔 {:%d/%m/%Y %Z}";
      tooltip-format = "<big>{:%Y %B %Z}</big>\n<tt><small>{calendar}</small></tt>";
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
        on-click-right = "mode";
      };
      interval = 60;
      calendar = {
        mode = "month";
        mode-mon-col = 3;
        weeks-pos = "right";
        on-scroll = 1;
        format = {
          months = "<span color='${h.base0D}'><b>{}</b></span>";
          days = "<span color='${h.base05}'><b>{}</b></span>";
          weeks = "<span color='${h.base0E}'><b>W{}</b></span>";
          weekdays = "<span color='${h.base0E}'><b>{}</b></span>";
          today = "<span color='${h.base08}'><b><u>{}</u></b></span>";
        };
      };
    };

    # Weather module (archik-dots style)
    "custom/weather" = {
      format = "{}";
      interval = 300;
      exec = "${pkgs.bash}/bin/bash ${./scripts/weather.sh}";
      tooltip = false;
    };

    # Media player (keeping your spotify integration)
    # "custom/media" = {
    #   format = "{icon} {text}";
    #   return-type = "json";
    #   max-length = 40;
    #   format-icons = {
    #     spotify = "<span foreground='#a0a0a0'> </span>";
    #   };
    #   escape = true;
    #   exec = "${mediaPlayerScript} --player spotify 2> /dev/null";
    #   on-click = "playerctl play-pause";
    # };

    # Tray
    tray = {
      icon-size = 18;
      spacing = 10;
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
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
      format-charging = "<span color='${h.base0D}'> </span>{capacity}%";
      format-full = "<span color='${h.base0D}'> </span>{capacity}%";
      format-warning = "<span color='${h.base08}'> </span>{capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };

    # Keeping your notification system
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
