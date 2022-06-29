require("bufferline").setup({
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both",
    -- number_style = "superscript", -- | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
    -- mappings = true, -- | false,
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = "", --'▎',
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = "nvim_lsp",
    offsets = {
      { filetype = "NvimTree", text = "NvimTree", text_align = "left" },
    },
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_close_icon = true, -- | false,
    show_tab_indicators = true, -- | false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist

    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thick", -- "slant" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true, -- | true,
    always_show_bufferline = true, -- | false,
    -- sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
    --  -- add custom logic
    --  return buffer_a.modified > buffer_b.modified
    -- end
    -- custom_filter = function(buf_number, _)
    -- filter out filetypes you don't want to see
    -- local list_of_fts = {"dap-repl", "log"}
    -- if vim.bo[buf_number].filetype ~= "dap-repl" then
    --   return true
    -- end

    -- filter out by buffer name
    -- if vim.fn.bufname(buf_number) ~= "__FLUTTER_DEV_LOG__" then
    --   return true
    -- end

    -- filter out based on arbitrary rules
    -- e.g. filter out vim wiki buffer from tabline in your work repo
    -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --   return true
    -- end

    -- filter out by it's index number in list (don't show first buffer)
    -- if buf_numbers[1] ~= buf_number then
    --   return true
    -- end
    -- end,
  },
})
