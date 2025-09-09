{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    vt = 1;

    settings = {
      default_session = {
        # Run gtkgreet inside cage (minimal Wayland compositor)
        command = "${pkgs.cage}/bin/cage -s -- ${pkgs.gtkgreet}/bin/gtkgreet -l";
        user = "greeter";
      };
    };
  };

  users.users.greeter = {
    isSystemUser = true;
    description = "Greeter user for greetd";
    shell = pkgs.bashInteractive;
  };

  environment.etc = {
    # Symlink wallpaper for greetd to reuse your hyprlock wallpaper
    "greetd/wallpaper.jpeg".source = ../../wallpapers/wallpaper.jpeg;

    # GTK CSS theme for gtkgreet
    "gtk-3.0/gtk.css".text = ''
      window {
          background-image: url("/etc/greetd/wallpaper.jpeg");
          background-size: cover;
          background-position: center;
      }

      entry {
          background-color: rgba(102, 92, 84, 0.33);
          color: #ebdbb2;
          border-radius: 10px;
          border: none;
          padding: 6px;
          font-family: "Maple Mono Bold";
          font-size: 14pt;
      }

      label {
          color: #ebdbb2;
          font-family: "Maple Mono";
      }

      button {
          background-color: rgba(102, 92, 84, 0.33);
          color: #ebdbb2;
          border-radius: 10px;
          font-family: "Maple Mono Bold";
          padding: 6px 12px;
      }
    '';
  };

  environment.etc."greetd/environments/Hyprland".text = ''
    Hyprland
  '';

  fonts.packages = with pkgs; [
    maple-mono
  ];
}
