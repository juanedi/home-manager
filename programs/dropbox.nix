{ config, pkgs, lib, ... }:

{
  home.activation.dropbox = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "${config.home.homeDirectory}/.dropbox-dist" ]; then
      tmpfile=$(mktemp /tmp/dropbox.XXXXXX.tar.gz)
      ${pkgs.wget}/bin/wget -O "$tmpfile" "https://www.dropbox.com/download?plat=lnx.x86_64"
      PATH="${pkgs.gzip}/bin:$PATH" ${pkgs.gnutar}/bin/tar xzf "$tmpfile" -C "${config.home.homeDirectory}"
      rm -f "$tmpfile"
    fi
  '';

  systemd.user.services.dropbox = {
    Unit = {
      Description = "Dropbox";
      After = [ "network.target" ];
    };
    Service = {
      ExecStart = "${config.home.homeDirectory}/.dropbox-dist/dropboxd";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
