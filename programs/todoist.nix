{ pkgs, ... }:

{
  home.packages = [
    (pkgs.callPackage ./todoist/package.nix { })
  ];
}
