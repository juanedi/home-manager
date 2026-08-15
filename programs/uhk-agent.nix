{ pkgs, ... }:

{
  # Agent copies its bundled docs out of the store on every launch. The store is
  # read-only, so the first copy leaves the destination unwritable and every later
  # launch dies on EACCES. Only a freshly created directory gets the bad mode, so
  # this recurs whenever a new version ships a new firmware doc directory.
  home.packages = [
    (pkgs.symlinkJoin {
      name = "uhk-agent-${pkgs.uhk-agent.version}";
      paths = [ pkgs.uhk-agent ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/uhk-agent --run \
          'chmod -R u+w "''${XDG_CONFIG_HOME:-$HOME/.config}/uhk-agent/smart-macro-docs" 2>/dev/null || true'
      '';
    })
  ];
}
