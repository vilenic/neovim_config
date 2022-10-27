local status_ok = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- require("user.lsp.settings.rust")


require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
