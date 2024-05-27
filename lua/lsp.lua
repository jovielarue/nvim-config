local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp = require("lspconfig")
lsp.util.default_config = vim.tbl_deep_extend("force", lsp.util.default_config, {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

local default_setup = function(server)
	require("lspconfig")[server].setup({
		capabilities = lsp_capabilities,
		root_dir = function(fname)
			return require("lspconfig").util.find_git_ancestor(fname)
		end,
	})
end

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"cssmodules_ls",
		"cssls",
		"css_variables",
		"dockerls",
		"eslint",
		"biome",
		"gradle_ls",
		"kotlin_language_server",
		"markdown_oxide",
		"tailwindcss",
		"lua_ls",
		"rust_analyzer",
	},
	handlers = {
		default_setup,
	},
})

require("lspconfig").lua_ls.setup({
	capabilities = lsp_capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = cmp.mapping.preset.insert({
		-- Enter key confirms completion item
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl + space triggers completion menu
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})
