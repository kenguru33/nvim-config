-- vim.notify = require("notify")
Status_OK, vim.notify = pcall(require, "notify")

if Status_OK then
	return
end
local set = vim.opt

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.hlsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = "utf-8"
set.termguicolors = true
set.cmdheight = 1

set.number = true
set.relativenumber = true
set.cursorline = true

set.hidden = true
set.showmode = false
set.showtabline = 2
set.signcolumn = "yes"
set.mouse = "a"

set.undofile = true
set.clipboard = "unnamedplus"
