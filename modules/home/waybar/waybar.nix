{ stylix, ... }:
{
  programs.waybar = {
    enable = true;
  };
    stylix.targets.waybar = {
    enable = true;
    font = "monospace";
  };
}