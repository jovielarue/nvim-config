return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
    "hrsh7th/cmp-buffer",   -- buffer auto-completion
    "hrsh7th/cmp-path",     -- path auto-completion
    "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
  },

  config = function()
    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end

    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'luasnip',       group_index = 4,  max_item_count = 8 }, -- For luasnip users.
        { name = 'nvim_lsp',      ground_index = 1, max_item_count = 8 },
        { name = 'path',          group_index = 2,  max_item_count = 8 },
        -- { name = 'cmdline',  max_item_count = 8 },
        { name = 'buffer',        group_index = 3,  max_item_count = 8 },
        { name = 'codecompanion', enabled = false },
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
