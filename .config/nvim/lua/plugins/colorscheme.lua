return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      transparent = true,
    },
  },
}
--[[
return {
  "sainnhe/everforest",
  lazy = false, -- カラースキームをすぐに適用
  priority = 1000,
  config = function()
    vim.g.everforest_background = "hard" -- "hard", "middle", "soft"の3種類
    vim.g.everforest_transparent = 1 -- 透明度を有効化
    vim.cmd("colorscheme everforest") -- カラースキームを適用
  end,
}
]]
--[[
return {
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false, -- 起動時に適用
    priority = 1000, -- 他のカラースキームより優先
    config = function()
      vim.cmd.colorscheme("nightfly")
    end,
  },
}
]]
