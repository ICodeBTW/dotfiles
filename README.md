# NixOS Configuration

A modular NixOS configuration with Hyprland, featuring a clean separation between system-level and user-level configurations.

## 📁 Structure

```
.
├── hosts/                    # Host-specific configurations
├── modules/
│   ├── core/                # System-level modules
│   │   ├── stylix/         # Theme management
│   │   ├── bootloader.nix
│   │   ├── hardware.nix
│   │   ├── network.nix
│   │   └── ...
│   ├── home/               # Home Manager modules
│   │   ├── hyprland/       # Hyprland WM configuration
│   │   ├── waybar/         # Status bar
│   │   ├── packages/       # User packages
│   │   └── ...
│   └── shells/             # Development shells
├── wallpapers/             # Background images
└── flake.nix              # Flake entry point
```

## ✨ Features

- **Wayland Compositor**: Hyprland with plugins
- **Status Bar**: Waybar with custom scripts
- **Terminal**: Alacritty with Zsh and Oh My Posh
- **Notifications**: SwayNC
- **App Launcher**: Rofi
- **Theme Management**: Stylix for consistent theming
- **Gaming**: Steam support
- **Virtualization**: Pre-configured VM support
- **Development**: Dev packages and Rust shell environment

## 🚀 Installation

### Prerequisites

- NixOS installed on your system
- Git installed
- Flakes enabled in your NixOS configuration

### Enable Flakes (if not already enabled)

Add to `/etc/nixos/configuration.nix`:

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

Then rebuild:

```bash
sudo nixos-rebuild switch
```

### Clone the Configuration

```bash
# Clone to your preferred location
git clone <your-repo-url> ~/.nixos-config
cd ~/.nixos-config
```

### Update Hardware Configuration

1. Copy your hardware configuration:
   ```bash
   sudo cp /etc/nixos/hardware-configuration.nix hosts/hardware-configuration.nix
   ```

2. Edit `hosts/default.nix` to match your system:
   - Set your hostname
   - Configure your username
   - Adjust any hardware-specific settings

### Build the System

#### First-time build:

```bash
# From the config directory
sudo nixos-rebuild switch --flake .#<hostname>

# If you kept the default hostname from hosts/default.nix
sudo nixos-rebuild switch --flake .#nixos
```

#### Using nh (included in config):

After the first build, you can use the included `nh` tool:

```bash
# Rebuild system
nh os switch

# Rebuild with nom output (better build output)
nh os switch -- --show-trace
```

### Update the System

```bash
# Update flake inputs
nix flake update

# Rebuild with updated inputs
sudo nixos-rebuild switch --flake .
```

## 🔧 Customization

### Changing Themes

Themes are managed via Stylix in `modules/core/stylix/`. You can:
- Modify `stylix.nix` to change the base16 theme
- Add custom themes in `custom_themes/`

### Adding Packages

- **System packages**: Add to `modules/core/program.nix`
- **User packages**: Add to `modules/home/packages/`
  - `cli.nix` for CLI tools
  - `gui.nix` for GUI applications
  - `dev.nix` for development tools

### Hyprland Configuration

Edit `modules/home/hyprland/config.nix` to customize:
- Keybindings
- Window rules
- Animations
- Workspace settings

### Waybar Customization

- **Layout**: `modules/home/waybar/settings.nix`
- **Styling**: `modules/home/waybar/style.nix`
- **Scripts**: `modules/home/waybar/scripts/`

## 🐚 Development Shells

Enter a development environment:

```bash
nix flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#{LANG}"
```

Check out Nix dev-templates [here](https://github.com/the-nix-way/dev-templates)

## 🎨 Wallpapers

Place wallpapers in the `wallpapers/` directory and configure them through:
- Hyprland: `modules/home/hyprland/config.nix`
- Waypaper: `modules/home/waypaper.nix`

## 📝 Common Commands

```bash
# Rebuild system
sudo nixos-rebuild switch --flake .

# Test configuration without switching
sudo nixos-rebuild test --flake .

# Rebuild and boot into new config (without switching current session)
sudo nixos-rebuild boot --flake .

# Clean up old generations
sudo nix-collect-garbage -d

# List generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
```

## 🆘 Troubleshooting

### Build fails with "error: getting status of '/nix/store/...'"
Try rebuilding with `--show-trace` for more details:
```bash
sudo nixos-rebuild switch --flake . --show-trace
```

### Hyprland doesn't start
Check logs:
```bash
journalctl -b -u display-manager
```

## 📚 Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Stylix Documentation](https://github.com/danth/stylix)

## 📄 License

This configuration is provided as-is. Feel free to use and modify for your own systems.