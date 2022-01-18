local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Disable formatting for tsserver
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
end

local servers = {
	"bashls",
	"tsserver",
	"sumneko_lua",
	"yamlls",
	"jsonls",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

local global_capabilities = vim.lsp.protocol.make_client_capabilities()
global_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	capabilities = global_capabilities,
})

lsp_installer.on_server_ready(function(server)
	-- Specify the default options which we'll use to setup all servers
	local opts = {
		on_attach = on_attach,
	}

	if server.name == "sumneko_lua" then
		local custom_opts = {
			settings = {

				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		}
		opts = vim.tbl_deep_extend("force", custom_opts, opts)
	end

	if server.name == "jsonls" then
		local custom_opts = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
				},
			},
		}
		opts = vim.tbl_deep_extend("force", custom_opts, opts)
	end

	if server.name == "yamlls" then
		local custom_opts = {
			settings = {
				yaml = {
					schemas = {
						["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.23.1-standalone-strict/all.json"] = "/*.k8s.yaml",
					},
				},
			},
		}
		opts = vim.tbl_deep_extend("force", custom_opts, opts)
	end
	server:setup(opts)
end)
