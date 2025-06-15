local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

local custom_config = require('configs.bindings')
local gpu_adapters = require('utils.gpu-adapter')

-- font
config.font_size = 18
config.font = wezterm.font {
  family = "Maple Mono NF CN",
  harfbuzz_features = { "calt=0", "zero=1", "cv01=1"}
}

-- color scheme
config.color_scheme = 'Catppuccin Frappe'

-- gpu
config.front_end = 'WebGpu'
webgpu_power_preference = 'HighPerformance'
webgpu_preferred_adapter = gpu_adapters:pick_best()

-- appearance
config.automatically_reload_config = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.window_background_opacity = 0.8
config.macos_window_background_blur = 15
config.text_background_opacity = 0.9
config.adjust_window_size_when_changing_font_size = false
config.initial_rows = 30
config.initial_cols = 100

-- cursor
config.default_cursor_style = "BlinkingBar"
config.animation_fps = 120
config.cursor_blink_ease_in = 'EaseOut'
config.cursor_blink_ease_out = 'EaseOut'
config.cursor_blink_rate = 650

-- launch
config.launch_menu = {
  {
    args = { 'zsh', '-l' },
    label = 'Zsh',
  },
}

config.window_padding = {
  left = 20,
  right = 20,
  bottom = 5,
  top = 5,
}

config.window_close_confirmation = 'NeverPrompt'

visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 250,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 250,
  target = 'CursorColor',
}

config.keys = custom_config.keys

return config
