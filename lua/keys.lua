local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Bufferline
map('n', '<Leader>bn', '<Cmd>:BufferLineCycleNext<CR>', opts)
map('n', '<Leader>bp', '<Cmd>:BufferLineCyclePrev<CR>', opts)

-- Telescope
map('n', '<Leader>ff', '<Cmd>:Telescope find_files<CR>', opts)
map('n', '<Leader>fg', '<Cmd>:Telescope live_grep<CR>', opts)
map('n', '<Leader>fh', '<Cmd>:Telescope help_tags<CR>', opts)

-- Format file
map('n', '=G', '<Cmd>:lua vim.lsp.buf.format()<CR>', opts)

-- Neotree
map('', '<TAB>', ":Neotree toggle<CR>", opts)

-- Gitsigns
map('n', "gb", "<Cmd>:Gitsigns blame_line<CR>", opts)
map('n', "gd", "<Cmd>:Gitsigns diffthis<CR>", opts)

-- CodeActionMenu
map('n', "cam", "<Cmd>:CodeActionMenu<CR>", opts)

-- Trouble
map('n', "tt", "<Cmd>:TroubleToggle<CR>", opts)

-- Colorizer
map('n', "ct", "<Cmd>:ColorizerToggle<CR>", opts)

-- Lsp
map("n", "<Leader>h", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<Leader>df", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<Leader>rf", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)

-- Cmp
map("n", "<Leader>gp", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "<Leader>gn", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<Leader>of", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Lazygit
map("n", "<Leader>lg", "<Cmd>LazyGit<CR>", opts)

