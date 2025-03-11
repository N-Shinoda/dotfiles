-- file
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false -- Do not create swap files.
--vim.opt.helplang = "ja" -- The language of the help file is Japanese.
vim.opt.hidden = true -- Don't need to save files when switching buffers.

-- cursor and display
vim.opt.cursorline = true -- Emphasizes the row with the cursor.
--vim.opt.cursorcolumn = true -- Emphasizes the column with the cursor.

-- clipboard sharing
vim.opt.clipboard:append({ "unnamedplus" }) -- Share registers and clipboard.

-- menu and commands
vim.opt.wildmenu = true -- Complete with the command line.
vim.opt.cmdheight = 1 -- Number of displayed lines on the command line.
vim.opt.laststatus = 2 -- Show status line at the bottom.
vim.opt.showcmd = true -- View commands entered on the command line.

-- search and replace
vim.opt.hlsearch = true -- Enable highlight search.
vim.opt.incsearch = true -- Enable incremental search.
vim.opt.matchtime = 1

-- colorscheme
vim.opt.termguicolors = true -- Use 24-bit color.
--vim.opt.background = "dark" -- Use dark colors.

-- indent
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- display
vim.opt.number = true
vim.opt.wrap = false
vim.opt.showtabline = 2 -- Show tabline(1: Always visible, 2: Show when tab is opened).
vim.opt.visualbell = false
vim.opt.showmatch = true

-- interface
vim.opt.winblend = 0 -- Window opacity.
vim.opt.pumblend = 0 -- Pop-up menu opacity.
vim.opt.signcolumn = "yes" -- View signed column.

-- global
vim.g.autoformat = false
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌",
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  }
vim.g.python3_host_prog = "/home/n-shinoda/.pyenv/versions/3.13.0/bin/python"
