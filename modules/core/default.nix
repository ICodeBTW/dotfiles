{ ... }:
{
  imports = [
    ./bootloader.nix
    ./hardware.nix
    # ./xserver.nix
    ./greeter
    ./network.nix
    ./nh.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./wayland.nix
    ./virtualization.nix
  ];
}