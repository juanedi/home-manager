# To update: bump version and set hash to "", then build to get the new hash.
{
  version = "9.20.0";
  x86_64-linux = {
    url = "https://electron-dl.todoist.net/linux/Todoist-linux-9.20.0-x86_64-latest.AppImage";
    hash = "sha256-Rpn7cobgYQt06d+t5XDYUZTOc/pnpRJIEXZeDAiJIH8=";
  };
  aarch64-linux = {
    url = "https://electron-dl.todoist.net/linux/Todoist-linux-9.20.0-arm64-latest.AppImage";
    hash = "sha256-0oyJXgu7BYjnKak3Gxo8XtI0kmGvPvAfNAB4fRnZsoE=";
  };
}
