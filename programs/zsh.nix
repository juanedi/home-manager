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
      sshk = "kitty +kitten ssh";
    } // lib.optionalAttrs pkgs.stdenv.isLinux {
      pbcopy  = "wl-copy -n";
      pbpaste = "wl-paste";
    } // lib.optionalAttrs pkgs.stdenv.isDarwin {
      lstcp = "lsof -i -n -P | grep TCP | grep LISTEN";
      claude-personal = "CLAUDE_CONFIG_DIR=~/.claude-personal ~/npm-installs/node_modules/@anthropic-ai/claude-code/cli.js";
    };

    oh-my-zsh = {
      enable = true;
    };

    sessionVariables = {
      DOOMDIR = "$HOME/.config/doom";
    } // lib.optionalAttrs pkgs.stdenv.isDarwin {
      EMACS = "/Applications/Emacs-29.4.app/Contents/MacOS/Emacs";
    };

    initContent = ''
      if [[ -f ~/.zsh-init-local ]]
      then
          source ~/.zsh-init-local
      fi
    '';
  };
}
