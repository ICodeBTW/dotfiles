{pkgs, inputs, ...}:

{
  imports = [ inputs.stylix.nixosModules.stylix ];



  stylix.image = "../../wallpapers/wallpaper.jpeg";


}