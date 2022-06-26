local dap_status_ok, dap = pcall(require, "dap")

if not dap_status_ok then
  vim.notify("dap failed to load in flutter-tools...")
end

local paths = require("user.paths")

require("flutter-tools").setup({
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
    run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
    register_configurations = function(_)
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
    end,
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    on_attach = require("user.lsp.handlers").on_attach
    -- capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
    --- OR you can specify a function to deactivate or change or control how the config is created
    -- capabilities = function(config)
    --   config.specificThingIDontWant = false
    --   return config
    -- end,
  },
})
