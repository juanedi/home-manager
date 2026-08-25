-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- The hyprsunset daemon must be running for the scheduled profiles in
-- hyprsunset.conf (nightlight at 20:00, off at 07:00) to apply. The shell's
-- nightlight plugin only starts it on a manual toggle, not at boot.
o.launch_on_start("hyprsunset")
