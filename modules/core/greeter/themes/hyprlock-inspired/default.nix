{ stdenv }:

stdenv.mkDerivation {
  pname = "sddm-hyprlock-inspired";
  version = "1.0";
  src = ./.;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/hyprlock-inspired
    cp -r * $out/share/sddm/themes/hyprlock-inspired/
  '';
}
