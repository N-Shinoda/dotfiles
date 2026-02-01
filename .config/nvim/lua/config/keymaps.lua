local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- jkでインサートモードを抜ける
vim.keymap.set("i", "jk", "<ESC>", term_opts)

-- HとLで行頭・行末に移動
vim.keymap.set("n", "H", "^", opts)
vim.keymap.set("n", "L", "$", opts)

-- Ctrl + h/j/k/l でウィンドウ移動
--keymap("n", "<C-h>", "<C-w>h", term_opts)
--keymap("n", "<C-j>", "<C-w>j", term_opts)
--keymap("n", "<C-k>", "<C-w>k", term_opts)
--keymap("n", "<C-l>", "<C-w>l", term_opts)

-- Space + wで保存、Space + qで終了
vim.keymap.set("n", "<leader>w", ":w<CR>", term_opts)
vim.keymap.set("n", "<leader>q", ":q<CR>", term_opts)

-- 次のバッファ
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
-- 前のバッファ
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
-- 空の新規バッファ
vim.keymap.set("n", "<leader>bn", ":enew<CR>", opts)
-- 新規ファイルを開く（カレントディレクトリ）
vim.keymap.set("n", "<leader>bf", ":edit", {noremap = true})
-- バッファを閉じる／削除
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)
-- 強制削除（未保存でも）
vim.keymap.set("n", "<leader>bD", ":bdelete!<CR>", opts )
-- 他のバッファをすべて閉じる
vim.keymap.set("n", "<leader>bo", ":%bdelete|edit #|normal `\"", opts)
-- バッファ一覧を表示
vim.keymap.set("n", "<leader>bl", ":ls<CR>", opts)
-- バッファを閉じてウィンドウも閉じる（q相当）
vim.keymap.set("n", "<leader>bq", ":quit<CR>", opts)

-- Yを y$に変更（デフォルトの yyを修正）
vim.keymap.set("n", "Y", "y$", term_opts)

-- Space + yでクリップボードコピー
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', term_opts)
-- Space + pでクリップボードペースト
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', term_opts)

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Explorer" })
vim.keymap.set("n", "<leader>ef", ":Neotree filesystem reveal left<CR>", { desc = "Open File Explorer" })
vim.keymap.set("n", "<leader>eb", ":Neotree buffers right<CR>", { desc = "Open Buffer Explorer" })
vim.keymap.set("n", "<leader>eg", ":Neotree git_status float<CR>", { desc = "Open Git Status" })
