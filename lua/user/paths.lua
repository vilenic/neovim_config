local home_path = os.getenv("HOME")
local nvim_data_path = vim.fn.stdpath("data")

FLUTTER_SDK_PATH = home_path .. "/Code/sdks/flutter"
DART_SDK_PATH = home_path .. "/Code/sdks/flutter/bin/cache/dart-sdk"
DART_CODE_DEBUGGER_PATH = nvim_data_path .. "dapinstall/dart/Dart-Code/out/dist/debug.js"
