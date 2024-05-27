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
  "catppuccin/nvim",
  "windwp/nvim-ts-autotag",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "html",
          "markdown",
          "markdown_inline",
        },
        sync_install = false,
        indent = { enable = true },
      })
    end,
  },
  "brenoprata10/nvim-highlight-colors",
  "RRethy/vim-illuminate",
  "lewis6991/hover.nvim",
  "plenary.nvim",
  "prettier/vim-prettier",
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          lua = { "stylua" },
          python = { "isort", "black" },
          sql = { "sql-formatter " },
        },
        format_on_save = { lsp_fallback = true, async = false, timeout_ms = 500 },
      })
      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  "diegoulloao/neofusion.nvim",
  "L3MON4D3/LuaSnip",
  "morhetz/gruvbox",
  "MunifTanjim/prettier.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "m4xshen/autoclose.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  -- Vscode-like pictograms
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
      "hrsh7th/cmp-buffer",   -- buffer auto-completion
      "hrsh7th/cmp-path",     -- path auto-completion
      "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
    },
  },
  -- Code snippet engine
  "L3MON4D3/LuaSnip",
})

require("autoclose").setup()
require("ibl").setup()
require("nvim-ts-autotag").setup()
require("nvim-highlight-colors").setup({})

local prettier = require("prettier")
prettier.setup({
  bin = "prettier", -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
vim.cmd("let g:prettier#config#single_quote = 'true'")
vim.cmd("let g:prettier#config#trailing_comma = 'all'")

vim.cmd("colorscheme gruvbox")
vim.cmd("packloadall")
vim.opt.termguicolors = true
