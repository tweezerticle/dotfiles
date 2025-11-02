-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13.6

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Send "CTRL-B" to the terminal when pressing CTRL-B, CTRL-B
	{
		key = "b",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({ key = "b", mods = "CTRL" }),
	},
	{
		key = "[",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "f",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.ShowTabNavigator,
	},
}

config.max_fps = 240
config.animation_fps = 120

config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 12.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "0F1113F0",
}

config.color_scheme = "Tangoesque (terminal.sexy)"
config.colors = {
	background = "0F1113", -- this will override whatever colors
	-- are in the color scheme
	tab_bar = {
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "0F1113F0",
			-- The color of the text for the tab
			fg_color = "#ffffff",
		},
	},
}

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.94
config.macos_window_background_blur = 15
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.25cell",
	bottom = "0.25cell",
}

-- and finally, return the configuration to wezterm
return config
