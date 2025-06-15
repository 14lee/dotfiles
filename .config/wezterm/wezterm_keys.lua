-- wezterm_keys.lua
local wezterm = require("wezterm")
local act = wezterm.action

-- 定义 leader 键和快捷键表
local leader_key_config = { key = "b", mods = "CTRL", timeout_milliseconds = 1500 }

local key_bindings = {
        -- 禁用默认绑定
        { key = "L", mods = "CTRL", action = act.DisableDefaultAssignment },
        { key = "H", mods = "CTRL", action = act.DisableDefaultAssignment },

        -- 其他快捷键
        { key = "D", mods = "CTRL", action = "ShowDebugOverlay" },
        { key = "+", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
        { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
        { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
        { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
        { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
        { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
        { key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
        { key = "s", mods = "LEADER", action = act.PaneSelect({ mode = "SwapWithActive" }) },
        { key = "b", mods = "LEADER", action = act.PaneSelect },
        { key = " ", mods = "LEADER", action = act.TogglePaneZoomState },
        { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
}

-- 定义 key_tables，因为它在 key_bindings 中被引用
local custom_key_tables = {
        resize_pane = {
                { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
                { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
                { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
                { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
                { key = "Escape", action = "PopKeyTable" },
        },
}

-- 返回一个包含所有这些配置的表
return {
    leader = leader_key_config,
    keys = key_bindings,
    key_tables = custom_key_tables, -- 也要返回 key_tables
}
