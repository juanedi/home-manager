#!/bin/bash

# Toggles the layout on the current active workspace between dwindle, scrolling, and master.
# Much like Omarchy's own omarchy-hyprland-workspace-layout-toggle, but adding the master layout to the rotation.

ACTIVE_WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.id')
CURRENT_LAYOUT=$(hyprctl activeworkspace -j | jq -r '.tiledLayout')

case "$CURRENT_LAYOUT" in
  dwindle) NEW_LAYOUT=scrolling ;;
  scrolling) NEW_LAYOUT=master ;;
  *) NEW_LAYOUT=dwindle ;;
esac

hyprctl keyword workspace $ACTIVE_WORKSPACE, layout:$NEW_LAYOUT
notify-send "󱂬    Workspace layout set to $NEW_LAYOUT"
