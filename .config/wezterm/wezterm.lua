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
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.CompleteSelection("PrimarySelection"),
  },

  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CMD",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },

  -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = "CMD",
    action = wezterm.action.Nop,
  }
}

return config
