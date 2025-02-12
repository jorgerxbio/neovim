return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedarkpro").setup({
      colors = {
        --bg = "#121212",
        bg = "#16181d",
        fg = "#abb2bf",
        red = "#ef596f",
        orange = "#d19a66",
        yellow = "#e5c07b",
        green = "#89ca78",
        cyan = "#2bbac5",
        blue = "#61afef",
        purple = "#d55fde",
        white = "#abb2bf",
        black = "#282c34",
        gray = "#5c6370",
        highlight = "#e2be7d",
        comment = "#7f848e",
        none = "NONE",
      }
    })
  end
}
