{ ... }:

{
  programs.git = {
    enable = true;

    lfs.enable = true;

    settings = {
      user = {
        name = "Juan Edi";
        email = "jedi11235@gmail.com";
      };

      github.user = "juanedi";

      aliases = {
        co = "checkout";
        st = "status";
        ci = "commit";
        br = "branch";
        f = "fetch";
        cp = "cherry-pick";
        diffs = "diff --staged";
        logr = "log --reverse";
        l1 = "log -1 -p";
      };
    };

    ignores = [
      "**.swp"
      "**.ignore"
      "**.ignore.*"
      ".envrc"
      ".direnv"
      ".python-version"
      ".dir-locals.el"
      ".claude/settings.local.json"
    ];
  };
}
