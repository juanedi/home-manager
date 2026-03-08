{ pkgs, ... }:

{
  home.packages = [
    (pkgs.callPackage ./mattermost/package.nix { })
  ];
}
