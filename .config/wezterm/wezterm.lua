local wezterm = require("wezterm")
local config = wezterm.config_builder()

------------------------------------------------------------
-- 基本設定
------------------------------------------------------------
config.automatically_reload_config = true
config.font_size = 12.0
config.use_ime = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

------------------------------------------------------------
-- タブ設定
------------------------------------------------------------
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

-- タブバーの透過
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる
config.window_background_gradient = {
	colors = { "#000000" },
}

-- タブバーの色設定
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

-- タブタイトルのカスタマイズ
--local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
--local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end

	--local edge_foreground = background
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)

------------------------------------------------------------
-- キーバインド
------------------------------------------------------------
config.disable_default_key_bindings = true
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
	-- 基本操作
	{ key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

	-- ペイン分割
	{ key = "\\", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- ペイン移動 (vim風)
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },

	-- タブ切り替え
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },

	-- ペインリサイズ
	{ key = "H", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Left", 3 }) },
	{ key = "J", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Down", 3 }) },
	{ key = "K", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 3 }) },
	{ key = "L", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Right", 3 }) },

	-- ズーム
	{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	-- ペインサイクル移動
	{ key = "o", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Next") },
	{ key = "i", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Prev") },

	-- ペイン選択UI
	{ key = "s", mods = "LEADER", action = wezterm.action.PaneSelect },

	-- コピー&ペースト
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },

	-- コピーモード (tmux風)
	{ key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },

	-- その他
	{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\x1b\r") },

	-- タブ名変更
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Tab name:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

return config
