local augroup = vim.api.nvim_create_augroup("AutoCmds", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- 余分な空白を削除
autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  callback = function()
    local save_cursor = vim.api.nvim_win_get_cursor(0) -- カーソル位置を保存
    vim.cmd([[silent! %s/\s\+$//e]]) -- 置換コマンド
    vim.api.nvim_win_set_cursor(0, save_cursor) -- カーソル位置を復元
  end,
})

-- 自動コメントを無効化
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- ファイルを開いたときにカーソル位置を復元
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    if row > 0 and row <= vim.api.nvim_buf_line_count(0) then
        vim.api.nvim_win_set_cursor(0, { row, col })
    end
  end,
})

-- 特定の言語けインデント幅を変更する
autocmd("FileType", {
  pattern = { "c", "cpp", "python", "java" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = true -- スペース
  end,
})

autocmd("FileType", {
  pattern = { "make", "*.mk" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = false -- タブ
  end,
})

-- グローバル変数に直前のタブのバッファ番号を保存
local last_tab_buffer = nil

-- タブを離れるときに現在のバッファ番号を記録
autocmd("TabLeave", {
  callback = function()
    last_tab_buffer = vim.api.nvim_get_current_buf()
  end,
})

-- タブが閉じられたら、そのときのバッファをbdelete
autocmd("TabClosed", {
  callback = function()
    if last_tab_buffer and vim.api.nvim_buf_is_loaded(last_tab_buffer) then
      vim.cmd("bdelete " .. last_tab_buffer)
    end
  end,
})

-- 自動でNetoTreeを開く
--[[
autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      vim.cmd("Neotree filesystem reveal left")
    end, 100) -- 100ミリ秒の遅延
  end,
})
]]
