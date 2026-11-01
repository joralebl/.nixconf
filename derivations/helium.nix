{
  lib,
  stdenv,
  autoPatchelfHook,
  makeWrapper,
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
let
  runtimeLibs = [
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
  ];
in
stdenv.mkDerivation (finalAttrs: {
  pname = "helium";
  version = "0.20.1.1";

  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${finalAttrs.version}/helium-${finalAttrs.version}-x86_64_linux.tar.xz";
    sha256 = "ICP6RM76D70+GQcch+kNYSdfCLqPW0jVjCNSFVZem1M=";
  };

  sourceRoot = "helium-${finalAttrs.version}-x86_64_linux";

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];
  autoPatchelfIgnoreMissingDeps = [
    "libQt5Core.so.5"
    "libQt5Gui.so.5"
    "libQt5Widgets.so.5"
    "libQt6Core.so.6"
    "libQt6Gui.so.6"
    "libQt6Widgets.so.6"
  ];
  buildInputs = runtimeLibs ++ [ stdenv.cc.cc.lib ];
  dontBuild = true;
  dontStrip = true;

  installPhase = ''

    runHook preInstall

    mkdir -p $out/opt/helium
    cp -a . $out/opt/helium/

    makeWrapper $out/opt/helium/helium $out/bin/helium \
      --suffix LD_LIBRARY_PATH : ${lib.makeLibraryPath runtimeLibs}

    install -Dm644 helium.desktop $out/share/applications/helium.desktop
    install -Dm644 product_logo_256.png \
      $out/share/icons/hicolor/256x256/apps/helium.png

    runHook postInstall
  '';
  meta = with lib; {
    description = "Fast, private, and honest web browser";
    homepage = "https://github.com/imputnet/helium";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" ];
    mainProgram = "helium";
    sourceProvenance = [ sourceTypes.binaryNativeCode ];
  };
})
