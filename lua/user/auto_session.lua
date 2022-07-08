local auto_session_status_ok, auto_session = pcall(require, "auto-session")

if not auto_session_status_ok then
  vim.notify("Auto-session could not be loaded!")
end

auto_session.setup({
  log_level = "info",
  auto_session_suppress_dirs = { "~/", "~/Projects" },
  auto_restore_enabled = false,
})
