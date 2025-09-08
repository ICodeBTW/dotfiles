{ config, pkgs, ... }:


# this only creates a service target, still need to start the proton bridge
# systemctl --user start --now proton-bridge 
# Added to hyprland config, but still have a look at it when first installed!



{
  home.packages = with pkgs; [ protonmail-bridge ];

systemd.user.services.proton-bridge = {
  Unit = {
    Description = "ProtonMail Bridge";
    After = [ "network-online.target" ];
  };

  Service = {
    ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive";
    Restart = "on-failure";
  };

  Install = {
    WantedBy = [ "default.target" ];
  };
};

}
