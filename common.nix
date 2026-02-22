{ config, pkgs, ... }:

{
  imports = [
    ./programs/autojump.nix
    ./programs/direnv.nix
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/zsh.nix
  ];


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.cachix
    pkgs.cloc
    pkgs.devenv
    pkgs.drawio
    pkgs.dig
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-format
    pkgs.elmPackages.elm-language-server
    pkgs.elmPackages.elm-review
    pkgs.fd
    pkgs.fswatch
    pkgs.gh
    pkgs.gnupg
    pkgs.gnuplot
    pkgs.graphviz
    pkgs.imagemagick
    pkgs.jq
    pkgs.nixfmt
    pkgs.nodejs
    pkgs.opencode
    pkgs.retry
    pkgs.ripgrep
    pkgs.shellcheck
    pkgs.tree
    pkgs.watch
    pkgs.watchexec
    pkgs.wget
    pkgs.yarn
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".claude/CLAUDE.md".source = ./dotfiles/CLAUDE.md;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
