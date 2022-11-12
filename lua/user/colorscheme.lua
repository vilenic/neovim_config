local M = {
  colorscheme = "gruvbox-material"
  -- colorscheme = "onenord",
  -- colorscheme = "everforest",
  -- local colorscheme = "nightfox"
  -- local colorscheme = "material"
}

-->> Colorscheme options <<--
vim.g.gruvbox_material_foreground = 'material'
-- vim.g.material_style = "palenight"
-- vim.g.everforest_background = "hard"
-- vim.g.everforest_better_performance = 1
----

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. M.colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. M.colorscheme .. " not found!")
  return
end

return M
