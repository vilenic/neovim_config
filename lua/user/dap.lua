local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
  print("dap_install problem")
end

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

-- local flutter_path = os.getenv("HOME") .. "/Code/sdks/flutter"

dap_install.setup({})

dap_install.config("lua", {})
dap_install.config("python", {})
dap_install.config("dart", {})

dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = {DART_CODE_DEBUGGER_PATH, "flutter" },
}
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = DART_SDK_PATH,
    flutterSdkPath = FLUTTER_SDK_PATH,
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
  },
}


dapui.setup({
  sidebar = {
    elements = {
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
    },
    size = 40,
    position = "right", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = {},
  },
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
