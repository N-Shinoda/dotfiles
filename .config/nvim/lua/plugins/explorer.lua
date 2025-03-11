return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true, -- NeoTreeだけが開いている場合、自動で閉じる
    popup_border_style = "rounded", -- ポップアップの枠を丸くする
    enable_git_status = true, -- Gitの変更ステータスを表示
    enable_diagnostics = true, -- LSPの診断情報を表示
    filesystem = {
      follow_current_file = { enabled = true }, -- 現在開いているファイルに追従
      hijack_netrw = true, -- netrw（標準のファイラー）を無効化
      -- hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true, -- ファイルの変更を自動検知
      filtered_items = {
        visible = false, -- デフォルトで隠されているかどうか
        show_hidden_count = true,
        hide_dotfiles = false, -- dotfilesを隠すかどうか
        hide_gitignored = false, -- gitignoreされているファイルを隠すかどうか
        hide_by_name = {
          "node_modules",
          "thumbs.db",
        },
        never_show = {
          ".git",
          ".DS_Store",
          ".history",
        },
      },
    },
    window = {
      width = 30, -- 左側のNeoTreeウィンドウの幅
      mappings = {
        ["<space>"] = "toggle_node", -- スペースキーでフォルダの展開/折りたたみ
        ["<cr>"] = "open", -- Enterで開く
        ["o"] = "open", -- "o"でも開けるように
        ["P"] = { "toggle_preview", config = { use_float = true } }, -- プレビューモード
        ["s"] = "split_with_window_picker", -- 水平分割して開く
        ["v"] = "vsplit_with_window_picker", -- 水平分割して開く
        ["t"] = "open_tabnew", -- 新しいタブで開く
        ["C"] = "close_node", -- フォルダを閉じる
        ["R"] = "refresh", -- NeoTreeをリフレッシュ
        ["a"] = { "add", config = { show_path = "relative" } }, -- ファイル/フォルダ追加
        ["d"] = "delete", -- 削除
        ["r"] = "rename", -- 名前変更
      },
    },
    git_status = {
      symbols = {
        -- Gitの変更ステータスを表示
        added = "+",
        modified = "",
        deleted = "✖",
        renamed = "➜",
        untracked = "*",
        ignored = "◌",
        unstaged = "✗",
        staged = "✓",
        conflict = "⚠",
      },
    },
  },
}
