local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("Null-ls could not be loaded...")
  return
end

local format_line_length = 100

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_args = {
        "--no-semi",
        "--single-quote",
        "--jsx-single-quote",
        "--print-width",
        format_line_length,
        "--prose-wrap", -- always enforces line wrap on markdown files.
        "always",
      },
    }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.dart_format.with({ extra_args = { "--line-length", format_line_length, "--fix" } }),
    formatting.stylua,
    diagnostics.flake8.with({ extra_args = { "--max-line-length", format_line_length } }),
  },
})
