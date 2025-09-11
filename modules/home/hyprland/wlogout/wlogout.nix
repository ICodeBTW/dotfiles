{
  pkgs,
  ...
}:

{    
  home.packages = with pkgs; [
    pkgs.wlogout
  ];
}