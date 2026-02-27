# Copied from nixpkgs/pkgs/by-name/to/todoist-electron/package.nix
# so we can control sources.nix independently of the nixpkgs channel.
{
  lib,
  stdenv,
  appimageTools,
  fetchurl,
  asar,
  makeWrapper,
}:

let
  sources = import ./sources.nix;

  pname = "todoist-electron";
  version = sources.version;
  src =
    fetchurl
      sources.${stdenv.hostPlatform.system}
        or (throw "Unsupported system: ${stdenv.hostPlatform.system}");

  appimageContents = appimageTools.extract {
    inherit pname version src;

    postExtract = ''
      ${lib.getExe asar} extract $out/resources/app.asar app
      sed -i 's/async isUpdateAvailable.*/async isUpdateAvailable(updateInfo) { return false;/g' app/node_modules/electron-updater/out/AppUpdater.js
      ${lib.getExe asar} pack app $out/resources/app.asar
    '';
  };
in
appimageTools.wrapAppImage {
  inherit pname version;
  src = appimageContents;

  extraPkgs = pkgs: [ pkgs.hidapi ];

  extraInstallCommands = ''
    install -D --mode 0644 ${appimageContents}/todoist.desktop -t $out/share/applications
    install -D --mode 0644 ${appimageContents}/todoist.png -t $out/share/icons/hicolor/512x512/apps
    substituteInPlace $out/share/applications/todoist.desktop \
      --replace-fail "Exec=AppRun" "Exec=todoist-electron --" \
      --replace-fail "Exec=todoist" "Exec=todoist-electron --"

    . ${makeWrapper}/nix-support/setup-hook
    wrapProgram $out/bin/todoist-electron \
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}"
  '';

  meta = {
    description = "Todoist - To-Do List & Task Manager";
    homepage = "https://www.todoist.com";
    license = lib.licenses.unfree;
    mainProgram = "todoist-electron";
    platforms = lib.attrNames sources;
  };
}
