local wezterm = require 'wezterm'

return {
  -- 💻 موجه الأوامر
  term = "wezterm",

  -- 🎨 الألوان
  colors = {
    foreground = "#f8f8f2",
    background = "#1e1e2e",
    cursor_bg = "#f8f8f2",
    cursor_fg = "#282a36",
    selection_bg = "#44475a",
    selection_fg = "#f8f8f2",

    ansi = {
      "#282a36", "#ff5555", "#50fa7b", "#f1fa8c",
      "#6272a4", "#bd93f9", "#8be9fd", "#bbbbbb",
    },
    brights = {
      "#5c6370", "#ff6e6e", "#50fa7b", "#f1fa8c",
      "#8be9fd", "#bd93f9", "#8be9fd", "#f8f8f2",
    },
  },

  -- 🖋️ الخط
  font = wezterm.font_with_fallback({
    { family = "Hack Nerd Font", weight = "Bold" },
  }),
  font_size = 14.0,

  -- 🖱️ الماوس
  hide_mouse_cursor_when_typing = true,

  -- 🔲 إعدادات النافذة
  window_decorations = "RESIZE",
  window_background_opacity = 0.95,
  window_close_confirmation = "NeverPrompt",
  initial_cols = 120,
  initial_rows = 30,
  enable_tab_bar = true,
  use_fancy_tab_bar = false,

  -- ✍️ العنوان
  window_frame = {
    font_size = 14.0,
    active_titlebar_bg = "#1e1e2e",
  },
  window_padding = {
    left = 2, right = 2, top = 1, bottom = 1,
  },

  -- 🔄 إعادة تحميل حي
  automatically_reload_config = true,

  -- ⌨️ اختصارات لوحة المفاتيح
  keys = {
    {
      key = "Enter",
      mods = "CMD",
      action = wezterm.action.ToggleFullScreen,
    },
  },

  -- 📜 التمرير
  scrollback_lines = 10000,

  -- 🎯 شكل المؤشر
  default_cursor_style = "BlinkingBar",

  -- 🔔 الجرس
  audible_bell = "Disabled",
  animation_fps = 60,
  cursor_blink_rate = 500,
}
