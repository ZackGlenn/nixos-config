{pkgs, lib, stdenv, unzip, makeDesktopItem, copyDesktopItems, ...}:

let
  desktopItem = makeDesktopItem {
    name = "kenku-fm";
    exec = "kenku-fm";
    desktopName = "Kenku FM";
    genericName = "Audio sharing for Discord";
  };
in stdenv.mkDerivation rec {
  name = "kenku-fm";
  version = "1.5.4";

  src = pkgs.fetchurl {
    url = "https://github.com/owlbear-rodeo/kenku-fm/releases/download/v${version}/Kenku.FM-linux-x64-${version}.zip";
    sha256 = "sha256-OGEC/UcEH86kH4uHqIfQAoZF/aj+o9rVUZDhOSOiWRc=";
  };
  
  nativeBuildInputs = [
    unzip
    copyDesktopItems
  ];

  unpackPhase = ''
    unzip $src -d $out
  '';

  installPhase = ''
    mkdir -p $out/bin $out/share/applications
    ln -s $out/"Kenku FM-linux-x64/kenku-fm" $out/bin/kenku-fm
    runHook copyDesktopItems
  '';

  desktopItems = [ desktopItem ];

  meta = {
    description = "Online tabletop audio sharing for Discord";
    homepage = "https://www.kenku.fm/";
    license  = lib.licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
  };
}
