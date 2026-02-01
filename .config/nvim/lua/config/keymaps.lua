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
-- Neo-treeを開く／閉じる
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Neotree Toggle" })
-- Neo-treeにフォーカス
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<CR>", { desc = "Focus Neo-tree" })
-- ファイルツリー
vim.keymap.set("n", "<leader>fe", "<cmd>Neotree filesystem reveal left<CR>", { desc = "Neo-tree filesystem" })
-- Gitステータス
vim.keymap.set("n", "<leader>fg", "<cmd>Neotree git_status reveal left<CR>", { desc = "Neo-tree Git status" })
-- バッファ一覧
vim.keymap.set("n", "<leader>fb", "<cmd>Neotree buffers reveal left<CR>", { desc = "Neo-tree Buffers" })
