{ pkgs, ... }:

{
  imports = [
    ./common.nix
    # ./programs/dropbox.nix
    ./programs/mattermost.nix
    ./programs/todoist.nix
    ./programs/uhk-agent.nix
  ];

  home.username = "jedi";
  home.homeDirectory = "/home/jedi";
  home.stateVersion = "25.11";

  # Arch has no /run/opengl-driver, so Nix-built GUI apps find no GL drivers.
  # Creating the symlink needs root: run `sudo non-nixos-gpu-setup` after a switch
  # that changes the drivers derivation (activation warns when it does).
  targets.genericLinux.gpu.enable = true;

  home.packages = with pkgs; [
    google-chrome
    ticktick
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
