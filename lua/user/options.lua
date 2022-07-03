HOME = vim.fn.expand("$HOME")

local options = {
  termguicolors = true,
  encoding = "utf-8",
  swapfile = false, -- whether to use a swapfile for a buffer
  undodir = HOME .. "/.nvim_undodir",
  undofile = true, -- save undo information in a file
  history = 1000,
  undolevels = 100,
  backup = false, -- create a backup file
  background = "dark",
  smarttab = true, -- use 'shiftwidth' when inserting <Tab>
  mouse = "a",
  showmode = false, -- message on status line to show current mode
  modelines = 5, -- number of lines for vim modeline options at top and bottom of file
  laststatus = 2,
  wildmenu = true,
  pumheight = 10, -- pop up menu height
  showtabline = 2, -- always show tabs
  hidden = false, -- hide buffers instead of closing them
  showcmd = false,
  langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
  ignorecase = true, -- ignore case in search patterns
  showmatch = true, -- briefly jump to matching bracket if insert one
  smartcase = true, -- no ignore case when pattern has uppercase
  autoindent = true, -- take indent for new line from previous line
  smartindent = true,
  autoread = true, -- autom. read file when changed outside of Vim
  incsearch = true, -- highlight match while typing search pattern
  updatetime = 300, -- faster completion
  completeopt = "menuone,noselect",
  pastetoggle = "<Insert>",
  clipboard = "unnamedplus",
  number = true,
  relativenumber = true,
  signcolumn = "yes", -- column on left for gutter signs (:n)
  colorcolumn = "+1", -- colorcolumn after textwidth
  cursorline = true,
  conceallevel = 0,
  wrap = false,
  scrolloff = 8,
  tabstop = 4, -- number of spaces that <Tab> in file uses
  softtabstop = 2,
  shiftwidth = 2, -- number of spaces to use for (auto)indent step
  expandtab = true, -- use spaces when <Tab> is inserted
  modeline = true, -- recognize modelines at start or end of file
  textwidth = 112,
  lazyredraw = false, -- don't redraw while executing macros
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all verical splits to go below current window
  foldcolumn = "0", -- width of the column used to indicate folds
  foldenable = true, -- set to display all folds open
  foldmethod = "indent",
  foldlevel = 0,
  foldnestmax = 10,
  foldlevelstart = 10,
  foldminlines = 20,
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.o.cmdheight = 2

--set foldmethod=indent
--set foldlevel=0
--set foldnestmax=1
