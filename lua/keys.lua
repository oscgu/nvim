local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- BufferLine
map('n', '<C-n>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferNext<CR>', opts)

-- Telescope
map('n', '<A-v>', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<A-g>', '<Cmd>Telescope live_grep<CR>', opts)

-- Format file
map('n', '=G', '<Cmd>lua vim.lsp.buf.formatting_sync(nil, 20000)<CR>', opts)

-- Neotree
map('', '<TAB>', ":Neotree toggle<CR>", opts)

-- Gitsigns
map('n', "gb", "<Cmd>:Gitsigns blame_line<CR>", opts)
map('n', "gd", "<Cmd>:Gitsigns diffthis<CR>", opts)

-- CodeActionMenu
map('n', "cam", "<Cmd>:CodeActionMenu<CR>", opts)
