{ config, pkgs, lib, ... }:

{
  home.activation.dropbox = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "${config.home.homeDirectory}/.dropbox-dist" ]; then
      tmpfile=$(mktemp /tmp/dropbox.XXXXXX.tar.gz)
      ${pkgs.wget}/bin/wget -O "$tmpfile" "https://www.dropbox.com/download?plat=lnx.x86_64"
      PATH="${pkgs.gzip}/bin:$PATH" ${pkgs.gnutar}/bin/tar xzf "$tmpfile" -C "${config.home.homeDirectory}"
      rm -f "$tmpfile"
    fi

    if [ ! -d "${config.home.homeDirectory}/.dropbox-bin" ]; then
      mkdir -p "${config.home.homeDirectory}/.dropbox-bin"
      ${pkgs.wget}/bin/wget -O "${config.home.homeDirectory}/.dropbox-bin/dropbox" "https://www.dropbox.com/download?dl=packages/dropbox.py"
      chmod +x "${config.home.homeDirectory}/.dropbox-bin/dropbox"
    fi
  '';

  home.sessionPath = [ "${config.home.homeDirectory}/.dropbox-bin" ];

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
