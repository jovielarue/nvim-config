return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "neovim/nvim-lspconfig",
    "js-everts/cmp-tailwind-colors",
    "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
    "hrsh7th/cmp-buffer",   -- buffer auto-completion
    "hrsh7th/cmp-path",     -- path auto-completion
    "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
  },

  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local twc = require("cmp-tailwind-colors")

    twc.setup({
      format = function(itemColor)
        return { fg = itemColor, bg = nil, text = nil }
      end,
    })

    local lspkindFormat = require("lspkind").cmp_format({
      mode = "symbol",
      max_width = 50,
    })

    cmp.setup({
      completion = { completeopt = "menu,menuone" },
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          vim.snippet.expand(args.body)            -- For native neovim snippets (Neovim v0.10+)
        end,
      },
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

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            require("luasnip").jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      sources = cmp.config.sources({
        { name = 'luasnip',  group_index = 4,  max_item_count = 8 }, -- For luasnip users.
        { name = 'nvim_lsp', ground_index = 1, max_item_count = 8 },
        { name = 'path',     group_index = 2,  max_item_count = 8 },
        -- { name = 'cmdline',  max_item_count = 8 },
        { name = 'buffer',   group_index = 3,  max_item_count = 8 },
        -- { name = 'codecompanion_models', enabled = true },
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
