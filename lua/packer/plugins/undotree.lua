packer.use({
	"mbbill/undotree",
})

local undodir = os.getenv("HOME") .. "/.undodir"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p", "0700")
end
vim.opt.undodir = undodir
vim.g.undotree_WindowLayout = 2
