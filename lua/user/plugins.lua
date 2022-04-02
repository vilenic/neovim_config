local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Error while loading packer")
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

---- PLUGINS ----

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({
        auto_close = false,
        view = {
          number = true,
          relativenumer = true,
        },
        diagnostics = {
          enable = true,
        },
      })
    end,
  })

  -- Colorschemes
  use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
  use("EdenEast/nightfox.nvim")

  -- CMP
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp") -- lsp completion
  use("hrsh7th/cmp-nvim-lua") -- lua completion

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use("jose-elias-alvarez/null-ls.nvim") -- linting and formatting
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  -- MISC
  use("psliwka/vim-smoothie") -- smooth scrolling

  use({
    "akinsho/nvim-bufferline.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  use({
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({
    "goolord/alpha-nvim",
    -- config = function ()
    --     require'alpha'.setup(require'alpha.themes.startify'.opts)
    -- end
  })
  use("lewis6991/impatient.nvim")

  use({ "numToStr/Comment.nvim" }) -- Comment

  use("folke/which-key.nvim")

  use("moll/vim-bbye") -- allows deleting buffers with explorer open without exiting neovim

  use("windwp/nvim-autopairs")

  use("tpope/vim-repeat")
  -- use "ggandor/lightspeed.nvim"

  use("phaazon/hop.nvim")

  use("ahmedkhalf/project.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)