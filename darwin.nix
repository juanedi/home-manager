{ ... }:

{
  imports = [ ./common.nix ];

  home.username = "jedi";
  home.homeDirectory = "/Users/jedi";
  home.stateVersion = "25.11";

  home.file = {
    ".hammerspoon".source = ./dotfiles/hammerspoon;
    ".config/karabiner/karabiner.json".source = ./dotfiles/karabiner.json;
  };
}
