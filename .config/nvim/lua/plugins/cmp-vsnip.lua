return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- 既存の opts を受け取って拡張する（破壊しない）
      table.insert(opts.sources, { name = "vsnip" }) -- vvsnip を追加
      return opts
    end,
  },
}
