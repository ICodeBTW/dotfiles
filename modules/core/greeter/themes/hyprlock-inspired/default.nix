{ lib, stdenv, fetchFromGitHub, qtbase, qtquickcontrols2, qtgraphicaleffects }:

stdenv.mkDerivation rec {
  pname = "sddm-hyprlock-inspired-theme";
  version = "1.0.0";

  src = ./.;  # Uses current directory as source

  buildInputs = [
    qtbase
    qtquickcontrols2
    qtgraphicaleffects
  ];

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall
    
    # Create the theme directory in the SDDM themes location
    mkdir -p $out/share/sddm/themes/hyprlock-inspired
    
    # Copy all theme files
    cp -r * $out/share/sddm/themes/hyprlock-inspired/
    
    # Ensure proper permissions
    chmod -R 755 $out/share/sddm/themes/hyprlock-inspired
    
    runHook postInstall
  '';

  meta = with lib; {
    description = "Hyprlock-inspired theme for SDDM";
    homepage = "https://github.com/ICODEBTW/dotfile.git";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = [ maintainers.shree ];
  };
}