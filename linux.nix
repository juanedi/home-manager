{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./programs/dropbox.nix
    ./programs/todoist.nix
  ];

  home.username = "jedi";
  home.homeDirectory = "/home/jedi";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    google-chrome
    ticktick
    uhk-agent
    (pkgs.writeShellScriptBin "hyprland-workspace-layout-cycle" (builtins.readFile ./scripts/hyprland-workspace-layout-cycle.sh))
  ];

  home.file = {
    ".local/share/applications" = {
      source = ./dotfiles/app-launchers;
      recursive = true;
    };

    ".config/hypr" = {
      source = ./dotfiles/hypr;
      recursive = true;
    };
  };
}
