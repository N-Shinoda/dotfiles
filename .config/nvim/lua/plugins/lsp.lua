return {
  {
    "neovim/nvim-lspconfig", -- LSPのサポート
    config = function()
      local lspconfig = require("lspconfig")

      -- clangdの設定
      lspconfig.clangd.setup({
        ont_attach = function(client, bufnr)
        -- キーマップなどの設定をここに追加
      end,
      flags = {
        debounce_text_changes = 150,
      },
      })
    end,
  },

  -- 補完の設定(nvim-cmp)
  {
  "hrsh7th/nvim-cmp", -- 補完プラグイン
  dependencies = {
      "hrsh7th/nvim-cmp", -- LSPとの補完結合
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#expand"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
      },
    })
  end,
  },
}
