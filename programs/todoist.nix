{ config, pkgs, lib, ... }:

{
  home.activation.todoist = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    printf '\033[33m[warning] Todoist installation is impure. To reinstall/remove, trash ~/Applications/Todoist*.AppImage\033[0m\n'
    if [ ! -f "${config.home.homeDirectory}/Applications/Todoist.AppImage" ]; then
      mkdir -p "${config.home.homeDirectory}/Applications"
      ${pkgs.wget}/bin/wget -O "${config.home.homeDirectory}/Applications/Todoist.AppImage" "https://todoist.com/linux_app/appimage"
      chmod +x "${config.home.homeDirectory}/Applications/Todoist.AppImage"
    fi
  '';

  home.file.".local/share/applications/icons/Todoist.png".source = ./../dotfiles/icons/todoist.png;
}
