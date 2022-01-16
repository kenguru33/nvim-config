function get_config(name)
	return string.format('require("config/%s")', name)
end

return require("packer").startup(function(use)
	use({
    "wbthomason/packer.nvim",
    requires = {},
    config = get_config("packer")
  })

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = get_config("nvim-tree"),
	})

  use({
    "EdenEast/nightfox.nvim",
    requires = {},
    config = get_config("nightfox")
  })
  
	if Packer_Bootstrap then
		require("packer").sync()
	end
end)


