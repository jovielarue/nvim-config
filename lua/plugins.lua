local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({	
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "m4xshen/autoclose.nvim",
  -- nvim-tree (file explorer)
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
  },
  -- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
})
require("autoclose").setup()
--local catppuccin = require("catppuccin")
--
--require("catppuccin").setup({
--    flavour = "auto", -- latte, frappe, macchiato, mocha
--    background = { -- :h background
--        light = "latte",
--        dark = "mocha",
--    },
--    transparent_background = false, -- disables setting the background color.
--    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--    dim_inactive = {
--        enabled = false, -- dims the background color of inactive window
--        shade = "dark",
--        percentage = 0.15, -- percentage of the shade to apply to the inactive window
--    },
--    no_italic = false, -- Force no italic
--    no_bold = false, -- Force no bold
--    no_underline = false, -- Force no underline
--    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--        comments = { "italic" }, -- Change the style of comments
--        conditionals = { "italic" },
--        loops = { },
--        functions = { },
--        keywords = {},
--        strings = {},
--        variables = {},
--        numbers = {},
--        booleans = {},
--        properties = {},
--        types = {},
--        operators = {},
--        -- miscs = {}, -- Uncomment to turn off hard-coded styles
--    },
--    color_overrides = {
--      mocha = {
--        text = '#f5f5f5',
--        subtext1 = '#dedede',
--        subtext0 = '#c7c7c7',
--        overlay2 = '#b3b3b3',
--        overlay1 = '#9c9c9c',
--        overlay0 = '#878787',
--        surface2 = '#707070',
--        surface1 = '#595959',
--        surface0 = '#454545',
--        base = '#2e2e2e',
--        mantle = '#262626',
--        crust = '#1c1c1c',
--      },
--    },
--    highlight_overrides = {
--      --Functions = {fg = macchiato.rosewater},
--    },
--    default_integrations = true,
--    integrations = {
--        cmp = true,
--        gitsigns = true,
--        nvimtree = true,
--        treesitter = true,
--        notify = false,
--        mini = {
--            enabled = true,
--            indentscope_color = "",
--        },
--        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--    },
--})

-- setup must be called before loading
vim.cmd 'colorscheme slate'
