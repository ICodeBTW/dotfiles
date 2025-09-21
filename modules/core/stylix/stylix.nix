{pkgs, inputs, ...}:

{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix.enable = true;


  stylix.image = ../../../wallpapers/wallpaper.jpeg;

  stylix.polarity = "dark";
  stylix.targets.gtk.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa-dragon.yaml";
  
  
  # Cursor option
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 24;

 stylix.fonts = {
    monospace = {
      package =     pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };
    
    # Additional fonts from your GTK config
    sansSerif = {
      package = pkgs.maple-mono.truetype-autohint;
      name = "Maple Mono";
    };
    
    serif = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font";
    };
    
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.icons = {
    enable = true;
    package = pkgs.papirus-icon-theme.override { color = "black"; };
  };
  
  # Font packages to install
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-emoji
    fantasque-sans-mono
    maple-mono.truetype-autohint
    papirus-icon-theme
  ];



}