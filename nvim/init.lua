vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

--lazy
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("config.lazy")

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

vim.opt.showtabline = 0

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.keymap.set("i", "<C-z>", "<lt>")

vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "L", ">gv")
vim.keymap.set("v", "H", "<gv")

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.scrolloff = 8
