local wezterm = require("wezterm")
local key_configs = require("wezterm_keys")

local config = {
  font_size = 18,
  font = wezterm.font {
    family = "Maple Mono NF CN",
    harfbuzz_features = { "calt=0", "zero=1", "cv01=1"},
  },
  color_scheme = "Catppuccin Mocha",

  automatically_reload_config = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
  show_new_tab_button_in_tab_bar = false,
  window_background_opacity = 0.8,
  macos_window_background_blur = 15,
  text_background_opacity = 0.9,
  adjust_window_size_when_changing_font_size = false,
  default_cursor_style = "BlinkingBar", -- 光标样式
  window_padding = {
    left = 20,
    right = 20,
    bottom = 5,
    top = 20,
  },

  -- leader = key_configs.leader,
  -- keys = key_configs.keys,
  -- key_tables = key_configs.key_tables,
}

return config
