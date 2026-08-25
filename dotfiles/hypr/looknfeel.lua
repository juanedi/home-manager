-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
  general = {
    -- No gaps between windows or borders.
    -- gaps_in = 0,
    -- gaps_out = 0,
    -- border_size = 0,

    -- Use master layout instead of dwindle.
    layout = "master",
  },

  master = {
    mfact = 0.60,
    new_status = "slave",
    new_on_top = true,
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- hl.config({
--   decoration = {
--     -- Use round window corners.
--     rounding = 8,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- chess.com styles
o.window("^.*chess\\.com.*$", { float = true, center = true, size = { 1000, 700 } })

-- ticktick styles
o.window("^ticktick$", { float = true, size = { 470, 940 }, rounding = 8 })

-- todoist styles
o.window("^Todoist$", { float = true, size = { 470, 940 }, rounding = 8 })
