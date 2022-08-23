local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<C-n>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
-- map('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', opts)
-- map('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', opts)
-- map('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', opts)
-- map('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', opts)
-- map('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', opts)
-- map('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', opts)
-- map('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', opts)
-- map('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', opts)
-- map('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', opts)
-- map('n', '<C-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
-- map('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
-- map('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)

map('n', '<A-v>', '<Cmd>Telescope find_files<CR>', opts)

-- Format file
map('n', '=G', '<Cmd>lua vim.lsp.buf.formatting_sync(nil, 20000)<CR>', opts)

