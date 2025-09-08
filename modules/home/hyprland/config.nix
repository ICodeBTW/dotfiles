{ ... }:
let
  browser = "firefox";
  terminal = "alacritty";
in
{
  wayland.windowManager.hyprland = {
    settings = {
      # autostart
      exec-once = [
        # "hash dbus-update-activation-environment 2>/dev/null"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

        "nm-applet &"
        "poweralertd &"
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "waybar &"
        "swaync &"
        "hyprctl setcursor Bibata-Modern-Ice 24 &"
        "swww-daemon &"

        "systemctl --user start hyprpolkitagent"
        "systemctl --user start proton-bridge"

        "hyprlock"

        "${terminal} --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
        "[workspace 1 silent] ${browser}"
        "[workspace 2 silent] ${terminal}"
      ];

      input = {
        kb_layout = "us";
        kb_options = "grp:alt_caps_toggle";
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        mouse_refocus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border"="rgb(cdd6f4)";
        "col.inactive_border"= "rgba(595959aa)";
        # border_part_of_window = false;
        no_border_on_floating = false;
        allow_tearing = true;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
      };

      dwindle = {
        force_split = 2;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 0;
        # active_opacity = 0.90;
        # inactive_opacity = 0.90;
        # fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          brightness = 1;
          contrast = 1.4;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = true;

          ignore_window = true;
          offset = "0 2";
          range = 20;
          render_power = 3;
          color = "rgba(00000055)";
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "fade_curve, 0, 0.55, 0.45, 1"
        ];

        animation = [
          # name, enable, speed, curve, style

          # Windows
          "windowsIn,   0, 4, easeOutCubic,  popin 20%" # window open
          "windowsOut,  0, 4, fluent_decel,  popin 80%" # window close.
          "windowsMove, 1, 2, fluent_decel, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn,      1, 3,   fade_curve" # fade in (open) -> layers and windows
          "fadeOut,     1, 3,   fade_curve" # fade out (close) -> layers and windows
          "fadeSwitch,  0, 1,   easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow,  1, 10,  easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim,     1, 4,   fluent_decel" # the easing of the dimming of inactive windows
          # "border,      1, 2.7, easeOutCirc"  # for animating the border's color switch speed
          # "borderangle, 1, 30,  fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces,  1, 4,   easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      binds = {
  movefocus_cycles_fullscreen = true;
};

bind = [
  # show keybinds list (Nix-only)
  "$mainMod, F1, exec, show-keybinds"

  # terminals
  "$mainMod, Return, exec, ${terminal} --gtk-single-instance=true"
  "ALT, Return, exec, [float; size 1111 700] ${terminal}"
  "$mainMod SHIFT, Return, exec, [fullscreen] ${terminal}"
  "$mainMod, RETURN, exec, alacritty"

  # browsers / apps
  "$mainMod, B, exec, [workspace 1 silent] ${browser}"
  "$mainMod, E, exec, nemo"                # nix extra
  "ALT, E, exec, hyprctl dispatch exec '[float; size 1111 700] nemo'"

  # kill / exit / lock
  "$mainMod, W, killactive,"                     # hyprland config wins
  "$mainMod, Q, exec, wlogout --protocol layer-shell"
  "$mainMod SHIFT, M, exit,"
  "$mainMod, L, exec, hyprlock"
  "$mainMod, Escape, exec, swaylock"
  "ALT, Escape, exec, hyprlock"
  "$mainMod SHIFT, Escape, exec, power-menu"

  # floating / dwindle / split
  "$mainMod, F, togglefloating,"
  "$mainMod, P, pseudo,"
  "$mainMod, X, togglesplit,"   # nix extra
  
  # fullscreen
  "$mainMod SHIFT, F, fullscreen, 1" # hyprland config wins

  # app launchers
  "$mainMod, D, exec, rofi -show drun || pkill rofi"
  "$mainMod SHIFT, D, exec, webcord --enable-features=UseOzonePlatform --ozone-platform=wayland"

  # misc apps
  "$mainMod, N, exec, swaync-client -t -sw"
  "CTRL SHIFT, Escape, exec, hyprctl dispatch exec '[workspace 9] missioncenter'"
  "$mainMod, equal, exec, woomer"
  "$mainMod, C, exec, hyprpicker -a"
  "$mainMod SHIFT, W, exec, hyprctl dispatch exec '[float; size 925 615] waypaper'"

  # screenshots
  "$mainMod, S, exec, grim -g \"$(slurp)\" - | swappy -f -"

  # move focus
  "$mainMod, left, movefocus, l"
  "$mainMod, right, movefocus, r"
  "$mainMod, up, movefocus, u"
  "$mainMod, down, movefocus, d"
  "$mainMod, h, movefocus, l"
  "$mainMod, j, movefocus, d"
  "$mainMod, k, movefocus, u"
  "$mainMod, l, movefocus, r"

  # alter z-order (Nix-only)
  "$mainMod, left,  alterzorder, top"
  "$mainMod, right, alterzorder, top"
  "$mainMod, up,    alterzorder, top"
  "$mainMod, down,  alterzorder, top"
  "$mainMod, h, alterzorder, top"
  "$mainMod, j, alterzorder, top"
  "$mainMod, k, alterzorder, top"
  "$mainMod, l, alterzorder, top"

  "CTRL ALT, up, exec, hyprctl dispatch focuswindow floating"
  "CTRL ALT, down, exec, hyprctl dispatch focuswindow tiled"

  # workspaces
  "$mainMod, 1, workspace, 1"
  "$mainMod, 2, workspace, 2"
  "$mainMod, 3, workspace, 3"
  "$mainMod, 4, workspace, 4"
  "$mainMod, 5, workspace, 5"
  "$mainMod, 6, workspace, 6"
  "$mainMod, 7, workspace, 7"
  "$mainMod, 8, workspace, 8"
  "$mainMod, 9, workspace, 9"
  "$mainMod, 0, workspace, 10"

  # move window to workspace
  "$mainMod SHIFT, 1, movetoworkspace, 1"
  "$mainMod SHIFT, 2, movetoworkspace, 2"
  "$mainMod SHIFT, 3, movetoworkspace, 3"
  "$mainMod SHIFT, 4, movetoworkspace, 4"
  "$mainMod SHIFT, 5, movetoworkspace, 5"
  "$mainMod SHIFT, 6, movetoworkspace, 6"
  "$mainMod SHIFT, 7, movetoworkspace, 7"
  "$mainMod SHIFT, 8, movetoworkspace, 8"
  "$mainMod SHIFT, 9, movetoworkspace, 9"
  "$mainMod SHIFT, 0, movetoworkspace, 10"

  # extra nix: silent move & empty workspace
  "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
  "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
  "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
  "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
  "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
  "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
  "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
  "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
  "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
  "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
  "$mainMod CTRL, c, movetoworkspace, empty"

  # move window
  "$mainMod SHIFT, left, movewindow, l"
  "$mainMod SHIFT, right, movewindow, r"
  "$mainMod SHIFT, up, movewindow, u"
  "$mainMod SHIFT, down, movewindow, d"
  "$mainMod SHIFT, h, movewindow, l"
  "$mainMod SHIFT, j, movewindow, d"
  "$mainMod SHIFT, k, movewindow, u"
  "$mainMod SHIFT, l, movewindow, r"

  # resize
  "$mainMod CTRL, left, resizeactive, -80 0"
  "$mainMod CTRL, right, resizeactive, 80 0"
  "$mainMod CTRL, up, resizeactive, 0 -80"
  "$mainMod CTRL, down, resizeactive, 0 80"
  "$mainMod CTRL, h, resizeactive, -80 0"
  "$mainMod CTRL, j, resizeactive, 0 80"
  "$mainMod CTRL, k, resizeactive, 0 -80"
  "$mainMod CTRL, l, resizeactive, 80 0"

  # move active
  "$mainMod ALT, left, moveactive,  -80 0"
  "$mainMod ALT, right, moveactive, 80 0"
  "$mainMod ALT, up, moveactive, 0 -80"
  "$mainMod ALT, down, moveactive, 0 80"
  "$mainMod ALT, h, moveactive,  -80 0"
  "$mainMod ALT, j, moveactive, 0 80"
  "$mainMod ALT, k, moveactive, 0 -80"
  "$mainMod ALT, l, moveactive, 80 0"

  # media keys
  ",XF86AudioPlay,exec, playerctl play-pause"
  ",XF86AudioNext,exec, playerctl next"
  ",XF86AudioPrev,exec, playerctl previous"
  ",XF86AudioStop,exec, playerctl stop"
  ",121, exec, pamixer -t"
  ",122, exec, pamixer -d 5"
  ",123, exec, pamixer -i 5"
  ",256, exec, pamixer --default-source -t"

  # brightness + rog keys
  ",232, exec, brightnessctl set 10%-"
  ",233, exec, brightnessctl set 10%+"
  ",237, exec, brightnessctl -d asus::kbd_backlight set 33%-"
  ",238, exec, brightnessctl -d asus::kbd_backlight set 33%+"
  ",210, exec, asusctl led-mode -n"
  ",211, exec, asusctl profile -n; pkill -SIGRTMIN+8 waybar"

  # scroll through workspaces
  "$mainMod, mouse_down, workspace, e+1"
  "$mainMod, mouse_up, workspace, e-1"

  # clipboard
  "$mainMod, V, exec, cliphist list | rofi -dmenu -theme-str 'window {width: 50%;} listview {columns: 1;}' | cliphist decode | wl-copy"
];


      # # binds active in lockscreen
      # bindl = [
      #   # laptop brigthness
      #   ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      #   ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      #   "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
      #   "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"
      # ];

      # # binds that repeat when held
      # binde = [
      #   ",XF86AudioRaiseVolume,exec, pamixer -i 2"
      #   ",XF86AudioLowerVolume,exec, pamixer -d 2"
      # ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [
        "float,class:^(Viewnior)$"
        "float,class:^(imv)$"
        "float,class:^(mpv)$"
        "tile,class:^(Aseprite)$"
        "float,class:^(Audacious)$"
        "pin,class:^(rofi)$"
        "pin,class:^(waypaper)$"
        # "idleinhibit focus,mpv"
        # "float,udiskie"
        "float,title:^(Transmission)$"
        "float,title:^(Volume Control)$"
        "float,title:^(Firefox — Sharing Indicator)$"
        "move 0 0,title:^(Firefox — Sharing Indicator)$"
        "size 700 450,title:^(Volume Control)$"
        "move 40 55%,title:^(Volume Control)$"

        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
        "workspace 1, class:^(${browser})$"
        "workspace 4, class:^(Gimp-2.10)$"
        "workspace 5, class:^(Spotify)$"
        "workspace 10, class:^(Vesktop)$"
        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit fullscreen, class:^(firefox)$"
        "float,class:^(org.gnome.Calculator)$"
        "float,class:^(waypaper)$"
        "float,class:^(zenity)$"
        "size 850 500,class:^(zenity)$"
        "size 725 330,class:^(SoundWireServer)$"
        "float,class:^(org.gnome.FileRoller)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(.sameboy-wrapped)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(File Upload)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"

        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"

        # No gaps when only
        "bordersize 0, floating:0, onworkspace:w[t1]"
        "rounding 0, floating:0, onworkspace:w[t1]"
        "bordersize 0, floating:0, onworkspace:w[tg1]"
        "rounding 0, floating:0, onworkspace:w[tg1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"

        # "maxsize 1111 700, floating: 1"
        # "center, floating: 1"

        # Remove context menu transparency in chromium based apps
        "opaque,class:^()$,title:^()$"
        "noshadow,class:^()$,title:^()$"
        "noblur,class:^()$,title:^()$"
      ];

      # No gaps when only
      workspace = [
        "w[t1], gapsout:0, gapsin:0"
        "w[tg1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

      monitor = [ "eDP-1, 1920x1080, 0x0, 1" "HDMI-A-1, 1920x1080, -1920x0, 1" ];

      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
