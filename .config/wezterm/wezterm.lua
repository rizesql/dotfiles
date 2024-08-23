local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = true

-- appearance config
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "Catppuccin Mocha"

-- font config
config.font = wezterm.font("Zed Mono", { bold = true })
config.font_size = 12.5

-- window config
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 20,
  right = 20,
  top = 4,
  bottom = 0,
}
config.enable_tab_bar = false

-- keys config
config.keys = {
  {
    key = "k",
    mods = "CMD",
    action = wezterm.action.Multiple {
      wezterm.action.ClearScrollback "ScrollbackAndViewport",
      wezterm.action.SendKey { key = "L", mods = "CTRL" },
    },
  },
  {
    key = "s",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = "S",
    mods = "CMD",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

config.mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CMD',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

return config
