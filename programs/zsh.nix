{ ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {
      hm    = "home-manager";
      hgrep = "history | grep -i";
      trim  = "sed \"s/^ *//g;s/ *$//g\"";
      eps   = "ps aux | grep -i";
      # lstcp = "lsof -i -n -P | grep TCP | grep LISTEN";
      gst   = "git status";
      # doom  = "~/.config/emacs/bin/doom";
    };

    oh-my-zsh = {
      enable = true;
      # theme = "be_nice";
      # custom = "$HOME/.oh-my-zsh-custom";
    };

    sessionVariables = {
      DOOMDIR = "$HOME/.config/doom";
    };

    # initExtraFirst = builtins.concatStringsSep "\n" [
    #  # uncomment if using a single-user nix installation
    #  # ". ~/.nix-profile/etc/profile.d/nix.sh"
    #  (builtins.readFile ./zsh/tmux-integration.zsh)
    #  (builtins.readFile ./zsh/zellij-integration.zsh)
    #  (builtins.readFile ./zsh/pdflatex-helpers.zsh)
    # ];

    initContent = builtins.readFile ../zsh/init-extra.zsh;
  };
}
