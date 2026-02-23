{ pkgs, ... }:

{
  # Install only the drawio CLI binary, without the .app bundle.
  # The full drawio package causes permission issues on macOS during
  # Home Manager's copyApps activation step (code signing changes
  # introduced after nixpkgs rev 4f619e6). Wrapping just the binary
  # avoids this on both platforms.
  home.packages = [
    (pkgs.runCommand "drawio-cli" { } ''
      mkdir -p $out/bin
      ln -s ${pkgs.drawio}/bin/drawio $out/bin/drawio
    '')
  ];
}
