{pkgs, inputs, ...}:

{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix.enable = true;


  stylix.image = ../../../wallpapers/wallpaper.jpeg;

  stylix.polarity = "dark";

  # stylix.base16Scheme = {
  #   base00 = "1e2330"; # background
  #   base01 = "2c3445"; # lighter bg
  #   base02 = "87c3e840"; # border / translucent blue (hex + alpha)
  #   base03 = "87c3e840"; # selection bg
  #   base04 = "e6f0fa";   # fg
  #   base05 = "87c3e8";   # accent blue
  #   base06 = "a3daff";   # accent glow
  #   base07 = "c0c0c0";   # grey
  #   base08 = "87c3e840"; # highlight (reuse glow tint)
  # };


  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
  
  
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
  ];



}