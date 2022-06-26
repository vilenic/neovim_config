local colorscheme_settings = require("user.colorscheme")

local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  vim.notify("Lualine could not be loaded")
end

lualine.setup({
  options = {
    theme = colorscheme_settings.colorscheme,
  },
})
