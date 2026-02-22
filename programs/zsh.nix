{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {
      hm    = "home-manager";
      hgrep = "history | grep -i";
      trim  = "sed \"s/^ *//g;s/ *$//g\"";
      eps   = "ps aux | grep -i";
      gst   = "git status";
      doom  = "~/.emacs.d/bin/doom";
    } // lib.optionalAttrs pkgs.stdenv.isLinux {
      pbcopy  = "wl-copy -n";
      pbpaste = "wl-paste";
    };

    oh-my-zsh = {
      enable = true;
    };

    sessionVariables = {
      DOOMDIR = "$HOME/.config/doom";
    };

    initContent = ''
      if [[ -f ~/.zsh-init-local ]]
      then
          source ~/.zsh-init-local
      fi
    '';
  };
}
