{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "andromeda-sddm";
  version = "git";

  src = fetchFromGitHub {
    owner = "EliverLara";
    repo  = "Andromeda-KDE";
    # First build: use lib.fakeSha256, then replace with the real hash Nix prints
    rev = "master";
    sha256 = lib.fakeSha256;
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/Andromeda
    # The repo’s SDDM bits are in the `sddm/` folder
    cp -r sddm/* $out/share/sddm/themes/Andromeda/
  '';

  meta = with lib; {
    description = "Andromeda SDDM theme by EliverLara";
    homepage    = "https://github.com/EliverLara/Andromeda-KDE";
    license     = licenses.gpl3Plus;
    platforms   = platforms.linux;
  };
}
