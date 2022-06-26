local M = {
  -- local colorscheme = "gruvbox"
  -- colorscheme = "onenord",
  colorscheme = "everforest",
  -- local colorscheme = "nightfox"
  -- local colorscheme = "material"
}

-->> Colorscheme options <<--
-- vim.g.material_style = "palenight"
vim.g.everforest_background = "medium"
vim.g.everforest_better_performance = 1
----

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. M.colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. M.colorscheme .. " not found!")
  return
end

return M
