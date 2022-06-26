-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.cmd([[

autocmd BufEnter *.py set tabstop=8 shiftwidth=4 softtabstop=4

" autocmd BufEnter *.js,*.html,*.css,Dockerfile,*.yml,*.md,.vimrc,.zshrc,*.sh,*.json,*.vim,*.lua,*.dart
"        \ set tabstop=4 |
"        \ set softtabstop=2 |
"        \ set shiftwidth=2 |

]])

