-- Autocompletion engine
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "neovim/nvim-lspconfig",
    "js-everts/cmp-tailwind-colors",
    "hrsh7th/cmp-nvim-lsp",                -- lsp auto-completion
    "hrsh7th/cmp-buffer",                  -- buffer auto-completion
    "hrsh7th/cmp-path",                    -- path auto-completion
    "hrsh7th/cmp-cmdline",                 -- cmdline auto-completion
    "hrsh7th/cmp-nvim-lsp-signature-help", -- lsp signature hints
  },

  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      completion = { completeopt = "menuone" },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),

        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },

        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        --
        --   ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --       cmp.select_prev_item()
        --     else
        --       fallback()
        --     end
        --   end, { "i", "s" }),
      },

      sources = cmp.config.sources({
        { name = 'path',                   group_index = 2,  max_item_count = 8 },
        { name = 'nvim_lsp',               ground_index = 1, max_item_count = 8 },
        { name = 'buffer',                 group_index = 3,  max_item_count = 8 },
        { name = 'nvim_lsp_signature_help' },
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          max_width = 50,
        })
      }
    })
  end
}
