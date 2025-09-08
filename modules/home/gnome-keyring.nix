{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ gnome-keyring gcr seahorse ];

  services.gnome-keyring.enable = true;
  services.gnome-keyring.components = [ "secrets" "ssh" ];

  # systemd.user.services.gnome-keyring = {
  #   Unit = {
  #     Description = "GNOME Keyring daemon";
  #     PartOf = [ "graphical-session.target" ];
  #   };
  #   Service = {
  #     ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets,ssh";
  #     Restart = "on-failure";
  #   };
  #   Install = {
  #     WantedBy = [ "graphical-session.target" ];
  #   };
  # };

  systemd.user.services.gnome-keyring.Unit.After = [ "graphical-session-pre.target" ];
}
