local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label ""
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["w"] = { "<cmd>w<CR>", "Save" },
  ["q"] = { "<cmd>qa<CR>", "Quit" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["P"] = { "<cmd>Telescope projects<cr>", "Projects" },
  -- ["z"] = { "<cmd>lua require('maximize').toggle()<cr>", "Maximize toggle" },
  ["m"] = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview" },

  d = {
    name = "Debugging",
    q = { "<cmd>DapTerminate<CR>", "Terminate debug session" },
    b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle breakpoint" },
    d = { "<cmd>DapContinue<CR> ", "Start/Continue" },
    s = { "<cmd>DapStepInto<CR> ", "Step Into" },
    o = { "<cmd>DapStepOut<CR> ", "Step Out" },
    n = { "<cmd>DapStepOver<CR> ", "Step Over" },
    v = { "<cmd>DapVirtualTextToggle<CR> ", "DAP VirtualText toggle" },
  },

  e = {
    name = "Explorer",
    e = {
      "<cmd>NvimTreeToggle<CR>",
      "Toggle explorer",
    },
    f = {
      "<cmd>NvimTreeFindFile<cr>",
      "Find file",
    },
    s = {
      "<cmd>:Telescope session-lens search_session<cr>",
      "Sessions",
    },
  },

  f = {
    name = "Telescope",
    f = {
      "<cmd>lua require('telescope.builtin').find_files({hidden = true}, require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find files",
    },
    b = {
      "<cmd>lua require('user.telescope').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Buffers",
    },
    F = {
      "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>",
      "Find Text in Workspace",
    },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    e = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in buffer" },
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  u = {
    name = "Utilites",
    f = { "<cmd>lua require('telescope').extensions.flutter.commands()<CR>", "Flutter tools" },
    r = {
      name = "Rust tools",
      r = {"<cmd>RustRunnables<CR>", "Runnables"},
      d = {"<cmd>RustDebuggables<CR>", "Runnables"},
      h = {"<cmd>lua require('rust-tools').inlay_hints.enable()<CR>", "Set inlay hints"},
      e = {"<cmd>lua require('rust-tools').inlay_hints.disable()<CR>", "Set inlay hints"},
    }
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>TroubleToggle document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "LSP Info" },
    I = { "<cmd>LspInstallInfo<cr>", "LSP Installer Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },

    l = { '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', "Diagnostic Float" },
    -- q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    t = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    s = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Symbol Info" },
    g = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    e = { "<cmd>Telescope lsp_references<cr>", "LSP references" },
    c = { "<cmd>Telescope lsp_definitions<cr>", "LSP definition" },
  },

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope grep_string<cr>", "Find cursor word" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  ["<leader>"] = {
    name = "Leader",
    j = { "<cmd>HopLine<cr>", "Jump to line" },
    f = { "<cmd>HopChar1CurrentLine<cr>", "Jump to char in line" },
    k = { "<cmd>HopChar2<cr>", "Jump to any char" },
    s = { "<cmd>luafile %<cr>", "Source lua file" },
  },

  t = {
    name = "Terminal",
    t = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=33 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  z = {
    name = "Zen",
    z = { "<cmd>TZAtaraxis<cr>", "Classic Zen" },
    f = { "<cmd>TZFocus<cr>", "Focus" },
    m = { "<cmd>TZMinimalist<cr>", "Minimalist" },
  },
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
