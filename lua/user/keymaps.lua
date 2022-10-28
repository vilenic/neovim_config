local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- local termopts = { silent = true }

---- VIM SPECIFIC ----
-- Remap space as leader key
keymap("", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
--

-- While in visual mode, indent selected text and keep it selected
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
--

-- Resize with arrow keys
keymap("n", "<M-Up>", ":resize +2<CR>", opts)
keymap("n", "<M-Down>", ":resize -2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)
--

-- Visual move text up and down
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("v", "p", '"_dP', opts)
--

---- **** ----

---- Bufferline ----
-- keymap("n", "]b", ":BufferLineCycleNext<CR>", opts)
-- keymap("n", "[b", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
---- **** ----

---- Term keymaps ----
-- keymap("t", "<Esc>", "<C-\\><C-n>", termopts)
---- **** ----
