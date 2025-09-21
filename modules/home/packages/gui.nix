{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    gimp
    pavucontrol
    vlc

    ## Office
    libreoffice
    gnome-calculator

    ## Utility
    dconf-editor
    gnome-disk-utility
    mission-center # GUI resources monitor
    zenity
    hyprpolkitagent


    #Mail 
    thunderbird
  
      
    # mics
    protonvpn-gui   
    jetbrains.idea-ultimate
    spotify
    pinta
    neovim
    calibre
    qbittorrent-enhanced
    anki-bin
    vscode
  ];
}
