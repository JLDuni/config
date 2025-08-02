vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

--lazy
require("config.lazy")

--colorscheme catppuccin


vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd.colorscheme "catppuccin"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.api.nvim_set_hl(0, "LineNr", { fg = "#6c7086" }) -- relativa
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f38ba8", bold = true }) -- atual

vim.opt.clipboard = "unnamedplus"
