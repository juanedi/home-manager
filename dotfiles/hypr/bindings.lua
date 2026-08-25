-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Bindings from the old bindings.conf that are now Omarchy defaults were
-- dropped: Music (SUPER+SHIFT+M), Music TUI (SUPER+SHIFT+ALT+M),
-- Passwords (SUPER+SHIFT+SLASH), Browser (SUPER+SHIFT+B and +ALT+B).

-- Application bindings
o.bind("SUPER + SHIFT + U", "TickTick", { focus = "^ticktick$", launch = "ticktick" })

hl.unbind("SUPER + SHIFT + E") -- was: Email
o.bind("SUPER + SHIFT + E", "Emacs", { focus = "^emacs$", launch = "emacs" })

hl.unbind("SUPER + SHIFT + W") -- was: Omawrite
o.bind("SUPER + SHIFT + W", "Browser", { focus = "google-chrome", launch = "google-chrome" })

o.bind("SUPER + SHIFT + K", "Mattermost", { webapp = "https://mm.jedi.dev/", focus = true })

hl.unbind("SUPER + SHIFT + G") -- was: Signal (WhatsApp default stays on SUPER+SHIFT+ALT+G)
o.bind("SUPER + SHIFT + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })

-- Terminals
hl.unbind("SUPER + SHIFT + RETURN") -- was: Browser
o.bind("SUPER + SHIFT + RETURN", "Terminal", { launch = 'xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)"' })

hl.unbind("SUPER + SHIFT + X") -- was: X
o.bind("SUPER + SHIFT + X", "Terminal", { focus = "ghostty", launch = "ghostty" })

-- Tiling
hl.unbind("SUPER + RETURN") -- was: Terminal
o.bind("SUPER + RETURN", "Swap focused window with master", hl.dsp.layout("swapwithmaster auto"))

hl.unbind("SUPER + L") -- was: Toggle workspace layout
o.bind("SUPER + L", "Change workspace layout", "hyprland-workspace-layout-cycle")
