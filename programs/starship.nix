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
        "$character"
      ];
      hostname = {
        ssh_only = true;
        format = "[@$hostname](bold blue) ";
      };
    };
  };
}
