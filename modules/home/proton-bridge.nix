{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ protonmail-bridge ];

systemd.user.services.proton-bridge = {
  Unit = {
    Description = "ProtonMail Bridge";
    After = [ "network-online.target" ];
  };

  Service = {
    ExecStart = "${pkgs.protonmail-bridge}/bin/proton-bridge --noninteractive";
    Restart = "on-failure";
  };

  Install = {
    WantedBy = [ "default.target" ];
  };
};

}
