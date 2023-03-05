 -- Set up nvim-cmp.
local cmp = require'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
    completion = {
      -- autocomplete = false
      keyword_length = 4
    },
    formatting = {
    -- formatting options      
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              cmp.confirm()
            else
              cmp.confirm()
          end
        else
          fallback()
        end
      end, {"i","s","c",}),
      ['<CR>'] = cmp.mapping.confirm(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-q>'] = cmp.mapping.abort(),
      ['<C-/>'] = cmp.mapping(function()
          if cmp.visible() then
              cmp.abort()
          else
              cmp.complete()
          end
      end, {"i","s","c",})

    }),
    sources = cmp.config.sources({
      { name = 'cmp_nvim_r', max_item_count = 5 },
      { name = 'nvim_lsp', max_item_count = 5 },
      { name = 'vsnip', max_item_count = 5 },
    }, {
      { name = 'buffer' },
    }),
      -- Use cmdline & path source for ':'
    cmp.setup.cmdline(':', {
      completion = {
          keyword_length = 4
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path', max_item_count = 5 }
      }, {
        { name = 'cmdline', max_item_count = 5 }
      })
    })
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

require 'cmp_nvim_r'.setup({
      filetypes = {'r', 'rmd', 'quarto'},
      doc_width = 58
})


