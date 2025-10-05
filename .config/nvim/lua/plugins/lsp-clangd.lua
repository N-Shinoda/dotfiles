return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          -- clangdの個別設定をここに書く（LazyVimの形式）
          flags = {
            debounce_text_changes = 150,
          },
          -- もし必要なら on_attach を書く
          -- on_attach = function(client, buffer) ... end,
        },
      },
    },
  },
}
