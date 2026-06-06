{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "\${custom.firstaide}"
        "$character"
      ];
      hostname = {
        ssh_only = true;
        format = "[@$hostname](bold blue) ";
      };
      custom.firstaide = {
        when = "command -v firstaide && ! firstaide status";
        symbol = "";
        style = "fg:red";
        format = "[$symbol]($style) ";
      };
    };
  };
}
