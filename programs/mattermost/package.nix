{
  lib,
  stdenv,
  appimageTools,
  fetchurl,
  makeWrapper,
}:

let
  sources = import ./sources.nix;

  pname = "mattermost-desktop";
  version = sources.version;
  src =
    fetchurl
      sources.${stdenv.hostPlatform.system}
        or (throw "Unsupported system: ${stdenv.hostPlatform.system}");

  appimageContents = appimageTools.extract {
    inherit pname version src;
  };
in
appimageTools.wrapAppImage {
  inherit pname version;
  src = appimageContents;

  extraInstallCommands = ''
    install -D --mode 0644 ${appimageContents}/mattermost-desktop.desktop -t $out/share/applications
    install -D --mode 0644 ${appimageContents}/mattermost-desktop.png $out/share/icons/hicolor/512x512/apps/mattermost-desktop.png
    substituteInPlace $out/share/applications/mattermost-desktop.desktop \
      --replace-fail "Exec=AppRun" "Exec=mattermost-desktop"

    . ${makeWrapper}/nix-support/setup-hook
    wrapProgram $out/bin/mattermost-desktop \
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}"
  '';

  meta = {
    description = "Mattermost Desktop";
    homepage = "https://mattermost.com";
    license = lib.licenses.asl20;
    mainProgram = "mattermost-desktop";
    platforms = lib.attrNames sources;
  };
}
