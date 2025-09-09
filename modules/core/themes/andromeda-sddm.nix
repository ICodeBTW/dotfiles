{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "andromeda-sddm";
  version = "git";

  src = fetchFromGitHub {
    owner = "EliverLara";
    repo  = "Andromeda-KDE";
    rev = "master";
    sha256 = "sha256-+OGtEjTCo++JUTUY3Hiplc/KlKxeMOEmETcQlvjTWa8=";  # build once to get the real hash
  };

  dontBuild = true;

  # Only fix the QtGraphicalEffects import, which is the critical one on Qt6
  postPatch = ''
    set -eu
    if [ -d sddm ]; then
      SEARCH_DIR=sddm
    elif [ -d SDDM ]; then
      SEARCH_DIR=SDDM
    else
      echo "ERROR: No SDDM directory found in source tree"; ls -la; exit 1
    fi

    # Replace "import QtGraphicalEffects" -> "import Qt5Compat.GraphicalEffects" where present
    while IFS= read -r -d "" f; do
      if grep -q "import[[:space:]]\+QtGraphicalEffects" "$f"; then
        substituteInPlace "$f" \
          --replace 'import QtGraphicalEffects' 'import Qt5Compat.GraphicalEffects' \
          || true
      fi
    done < <(find "$SEARCH_DIR" -type f -name '*.qml' -print0)
  '';

  installPhase = ''
    set -eu
    if [ -d sddm ]; then
      SRC_DIR=sddm
    elif [ -d SDDM ]; then
      SRC_DIR=SDDM
    else
      echo "ERROR: No SDDM directory found for install"; exit 1
    fi

    mkdir -p "$out/share/sddm/themes/Andromeda"
    cp -r "$SRC_DIR"/* "$out/share/sddm/themes/Andromeda/"
  '';

  meta = with lib; {
    description = "Andromeda SDDM theme (Qt6 compat for GraphicalEffects)";
    homepage    = "https://github.com/EliverLara/Andromeda-KDE";
    license     = licenses.gpl3Plus;
    platforms   = platforms.linux;
  };
}
