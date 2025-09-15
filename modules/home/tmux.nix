{ pkgs, ... }:
{
  programs.tmux = {
    enable = false;

    plugins = with pkgs; [
    ];

    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set-environment -g COLORTERM "truecolor"
    '';
  };


  # Until Tmux works
  programs.zellij = {
    
    enable = true;


  };

}
