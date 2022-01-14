if not packer then
	packer = require("packer")
end

-- run packer sync on write to plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
end)
