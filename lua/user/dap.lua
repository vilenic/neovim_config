local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
  vim.notify("dap-install could not be loaded")
end

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

local paths = require("user.paths")

dap_install.setup({})

dap_install.config("lua", {})
dap_install.config("python", {})
dap_install.config("dart", {})

dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = { paths.DART_CODE_DEBUGGER_PATH, "flutter" },
}
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = paths.DART_SDK_PATH,
    flutterSdkPath = paths.FLUTTER_SDK_PATH,
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
  },
}

dapui.setup({
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "right",
    },
  },
  {
    elements = {
      "repl",
      "console",
    },
    size = 10,
    position = "bottom",
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
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
