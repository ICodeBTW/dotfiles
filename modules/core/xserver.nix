{ pkgs, ... }:
{
  # Minimal X11 infrastructure for XWayland
  services.xserver.enable = true;

  # Essential packages for Steam/Gaming on Wayland
  environment.systemPackages = with pkgs; [
    xwayland
    xorg.xhost
    xorg.xauth
    xorg.xrandr
    xorg.libX11
    xorg.libXext
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXcursor
    xorg.libXi
    mesa
    libGL
  ];
 

}
