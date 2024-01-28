-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:

config.scrollback_lines = 5000
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
config.force_reverse_video_cursor = true
config.automatically_reload_config = false
config.show_update_window = false
config.check_for_updates = false

config.font = wezterm.font("Fira Code", { weight = "Medium" })
config.font_size = 13
config.color_scheme = "tokyonight_night"
config.window_padding = {
	left = 8,
	right = 8,
	top = 0,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
