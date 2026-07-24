{ pkgs, ... }:

{
  imports = [ ./common.nix ];

  home.username = "jedi";
  home.homeDirectory = "/Users/jedi";
  home.stateVersion = "25.11";

  # Nerd Font glyphs only (icons/symbols), for terminal/statusline use.
  # Home Manager symlinks these into ~/Library/Fonts/HomeManager on macOS.
  home.packages = [
    pkgs.nerd-fonts.symbols-only
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.file = {
    ".hammerspoon".source = ./dotfiles/hammerspoon;
    ".config/karabiner/karabiner.json".source = ./dotfiles/karabiner.json;
  };
}
