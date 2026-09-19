-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- The hyprsunset daemon must be running for the scheduled profiles in
-- hyprsunset.conf (nightlight at 20:00, off at 07:00) to apply. The shell's
-- nightlight plugin only starts it on a manual toggle, not at boot.
o.launch_on_start("hyprsunset")

-- Solaar only reapplies saved device settings (MX Master DPI, smart shift) while
-- it is running, and the device forgets them on every reconnect. Its Arch package
-- ships no autostart entry, so start it hidden in the tray at login.
o.launch_on_start("solaar --window=hide")
