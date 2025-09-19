{ ... }:
{
  imports = [
    ./btop.nix                        # Btop
    ./discord.nix                     # discord
    ./fzf.nix                         # fuzzy finder
    ./gaming.nix                      # packages related to gaming
    ./alacritty.nix                     # terminal
    ./git.nix                         # version control
    # ./gtk.nix                         # gtk theme
    ./firefox.nix                     # browser setting
    ./hyprland                        # window manager
    ./ohmyposh/ohmyposh.nix
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
    ./tmux.nix
    ./proton-bridge.nix
    ./nemo.nix
  ];
}
