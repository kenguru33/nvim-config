local get_config = function(name)
	return string.format('require("plugins/config/%s")', name)
end

local packer = require("packer")
-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Plugins start
	use({
		"wbthomason/packer.nvim",
		requires = {},
		config = get_config("packer"),
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = get_config("nvim-tree"),
	})

	use({
		"EdenEast/nightfox.nvim",
		requires = {},
		config = get_config("nightfox"),
	})

	use({
		"williamboman/nvim-lsp-installer",
		requires = "neovim/nvim-lspconfig",
		config = get_config("lspconfig"),
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind-nvim",
		},
		config = get_config("cmp"),
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = get_config("null-ls"),
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {},
		run = ":TSUpdate",
		config = get_config("treesitter"),
	})

	use({
		"nvim-treesitter/nvim-treesitter-refactor",
		after = "nvim-treesitter",
		requires = {},
		config = get_config("treesitter-refactor"),
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = get_config("telescope"),
	})
	use({
		"windwp/nvim-autopairs",
		requires = {},
		config = get_config("autopairs"),
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = get_config("lualine"),
	})

	use({
		"romgrk/barbar.nvim",
		requires = {},
		config = get_config("barbar"),
	})

	use({
		"rcarriga/nvim-notify",
		requires = {},
		config = get_config("notify"),
	})

	use({
		"mbbill/undotree",
		requires = {},
		config = get_config("undotree"),
	})
	-- Plugins Ends

	if Packer_Bootstrap then
		require("packer").sync()
	end
end)
