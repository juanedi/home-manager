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
      sshk = "kitty +kitten ssh";
    } // lib.optionalAttrs pkgs.stdenv.isLinux {
      pbcopy  = "wl-copy -n";
      pbpaste = "wl-paste";
      doom  = "~/.emacs.d/bin/doom";
    } // lib.optionalAttrs pkgs.stdenv.isDarwin {
      lstcp = "lsof -i -n -P | grep TCP | grep LISTEN";
      doom = "~/.config/emacs/bin/doom";

      # TODO: clean this up! better rely on project env variables to determine credentials
      claude-personal = "CLAUDE_CONFIG_DIR=~/.claude-personal ~/npm-installs/node_modules/@anthropic-ai/claude-code/cli.js";
      claude-nri = "CLAUDE_CONFIG_DIR=~/.claude-nri ~/npm-installs/node_modules/@anthropic-ai/claude-code/cli.js";
    };

    oh-my-zsh = {
      enable = true;
    };

    sessionVariables = {
      DOOMDIR = "$HOME/.config/doom";
      LANG = "en_US.UTF-8";
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
