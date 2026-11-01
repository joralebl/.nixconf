{
  pkgs,
  lib,
  stdenv,
  fetchurl,
  dbus,
  at-spi2-atk,
  at-spi2-core,
  nss,
  alsa-lib,
  cups,
  libxkbcommon,
  nspr,
  pango,
  cairo,
  glib,
  libGL,
  libgbm,
  expat,
  libxcb,
  libX11,
  libXext,
  libXcomposite,
  libXdamage,
  libXfixes,
  libXrandr,
  libXrender,
  udev,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "helium";
  version = "0.20.1.1";

  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${finalAttrs.version}/helium-${finalAttrs.version}-x86_64_linux.tar.xz";
    sha256 = "ICP6RM76D70+GQcch+kNYSdfCLqPW0jVjCNSFVZem1M=";
  };

  sourceRoot = "helium-${finalAttrs.version}-x86_64_linux";

  nativeBuildInputs = [ pkgs.makeWrapper ];

  installPhase = ''
    mkdir -p $out/opt/helium
    cp -a . $out/opt/helium/

    mkdir -p $out/bin
    wrapProgram $out/opt/helium/helium \
      --suffix LD_LIBRARY_PATH : ${
        lib.makeLibraryPath [
          glib
          nspr
          nss
          cups
          expat
          libxcb
          libX11
          libXext
          libXcomposite
          libXdamage
          libXfixes
          libXrender
          libXrandr
          libxkbcommon
          alsa-lib
          at-spi2-atk
          at-spi2-core
          cairo
          pango
          libgbm
          libGL
          udev
          dbus
        ]
      }

    ln -s $out/opt/helium/helium $out/bin/helium

    mkdir -p $out/share/applications
    cp helium.desktop $out/share/applications/

    mkdir -p $out/share/icons/hicolor/256x256/apps
    cp product_logo_256.png $out/share/icons/hicolor/256x256/apps/helium.png
  '';
  meta = with lib; {
    description = "Fast, private, and honest web browser";
    homepage = "https://github.com/imputnet/helium";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" ];
    maintainers = [
      "joralebl"
    ];
  };
})
