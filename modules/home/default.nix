{ ... }:
{
  imports = [
    ./btop.nix                        # Btop
    ./discord.nix                     # discord
    ./fzf.nix                         # fuzzy finder
    ./gaming.nix                      # packages related to gaming
    ./alacritty.nix                     # terminal
    ./git.nix                         # version control
    ./gnome-keyring.nix                       # gnome keyring
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./p10k/p10k.nix
    ./packages                        # other packages
    ./rofi.nix                        # launcher
    ./ssh.nix                         # ssh config
    ./swaylock.nix                    # lock screen
    ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix               # notification deamon
    ./waybar                          # status bar
    ./waypaper.nix                    # GUI wallpaper picker
    ./xdg-mimes.nix                   # xdg config
    ./zsh                             # shell
    ./proton-bridge.nix
    ./nemo.nix
  ];
}
