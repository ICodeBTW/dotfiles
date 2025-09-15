{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    wlogout
  ];

  xdg.configFile = {
    "wlogout/layout".text = ''
      {
    "label" : "lock",
    "action" : "${pkgs.hyprlock}/bin/hyprlock",
    "text" : "Lock",
    "keybind" : "l"
}
{
    "label" : "hibernate",
    "action" : "systemctl hibernate",
    "text" : "Hibernate",
    "keybind" : "h"
}
{
    "label" : "logout",
    "action" : "hyprctl dispatch exit",
    "text" : "Logout",
    "keybind" : "e"
}
{
    "label" : "shutdown",
    "action" : "systemctl poweroff",
    "text" : "Shutdown",
    "keybind" : "s"
}
{
    "label" : "suspend",
    "action" : "systemctl suspend",
    "text" : "Suspend",
    "keybind" : "u"
}
{
    "label" : "reboot",
    "action" : "systemctl reboot",
    "text" : "Reboot",
    "keybind" : "r"
}
    '';
    
    "wlogout/style.css".text = ''
      * {
        background-image: none;
      }
      window {
        background-color: rgba(12, 12, 12, 0.9);
        opacity: 0.9;
      }
      button {
        color: #FFFFFF;
        background-color: #1E1E1E;
        border-style: solid;
        border-width: 2px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
      }
      button:focus, button:active, button:hover {
        background-color: #3194f7;
        outline-style: none;
        text-shadow: none;
      }
      #lock {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/lock.png");
      }
      #logout {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/logout.png");
      }
      #suspend {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/suspend.png");
      }
      #hibernate {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png");
      }
      #shutdown {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png");
      }
      #reboot {
        background-image: url("${pkgs.wlogout}/share/wlogout/icons/reboot.png");
      }
    '';
  };
}
