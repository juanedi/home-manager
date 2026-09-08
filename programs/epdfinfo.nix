{ config, lib, pkgs, ... }:

{
  # Installs the epdfinfo binary (from emacsPackages.pdf-tools) into the path so
  # that Doom's straight-installed pdf-tools picks it up, enabling
  # pdf-view-mode.
  #
  # Without this, emacs will try to compile the binary from source, which
  # requires installing non-trivial development dependencies.
  home.packages = [
    (pkgs.runCommand "epdfinfo" { } ''
      mkdir -p $out/bin
      ln -s ${pkgs.emacsPackages.pdf-tools}/share/emacs/site-lisp/elpa/pdf-tools-*/epdfinfo $out/bin/epdfinfo
    '')
  ];
}
