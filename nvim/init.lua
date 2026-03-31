vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

--lazy
require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.api.nvim_set_hl(0, "LineNr", { fg = "#6c7086" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f38ba8", bold = true })

vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false

vim.opt.mouse = ""

vim.opt.scrolloff = 8
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "L", ">gv")
vim.keymap.set("v", "H", "<gv")
