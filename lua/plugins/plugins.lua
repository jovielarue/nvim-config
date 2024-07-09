return({
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-dap-ui",
  "jay-babu/mason-nvim-dap.nvim",
  "folke/neodev.nvim",
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  "ThePrimeagen/vim-be-good",
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  "tpope/vim-fugitive",
  "Exafunction/codeium.nvim",
  "plenary.nvim",
  "MunifTanjim/prettier.nvim",
  {
    "L3MON4D3/LuaSnip",
    dependencies =
    { "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
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
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },
})

-- vim.cmd("colorscheme gruvbox")
