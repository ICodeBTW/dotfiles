{
  config,
  pkgs,
  inputs,
  ...
}:
let
  c = config.lib.stylix.colors; # hex without #
  h = c.withHashtag;
  # Generate a CSS snippet that defines swaync aliases from Stylix base16 colors
  swayncColors = ''
      @define-color shadow rgba(0, 0, 0, 0.25);

      @define-color base       ${h.base00};
      @define-color mantle     ${h.base01};
      @define-color crust      ${h.base02};

      @define-color text       ${h.base05};
      @define-color subtext0   ${h.base04};
      @define-color subtext1   ${h.base03};

      @define-color surface0   ${h.base01};
      @define-color surface1   ${h.base02};
      @define-color surface2   ${h.base03};

      @define-color green      ${h.base0B};
  '';

in
{
  home.packages = with pkgs; [ swaynotificationcenter ];

  xdg.configFile."swaync/style.css".text = swayncColors + "\n" + builtins.readFile ./style.css;

  xdg.configFile."swaync/config.json".source = ./config.json;
}
