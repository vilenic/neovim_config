local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")

if not nvim_tree_status_ok then
  vim.notify("NvimTree could not be loaded...")
end

nvim_tree.setup({
  update_cwd = true,
  view = {
    number = false,
    relativenumber = true,
    adaptive_size = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  diagnostics = {
    enable = true,
  },
})
