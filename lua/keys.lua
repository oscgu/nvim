local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Bufferline
map("n", "<Leader>bn", "<Cmd>:BufferLineCycleNext<CR>", opts) map("n", "<Leader>bp", "<Cmd>:BufferLineCyclePrev<CR>", opts)

-- Telescope
map("n", "<Leader>ff", "<Cmd>:Telescope find_files<CR>", opts)
map("n", "<Leader>lg", "<Cmd>:Telescope live_grep<CR>", opts)
map("n", "<Leader>ht", "<Cmd>:Telescope help_tags<CR>", opts)
map("n", "<Leader>fb", "<Cmd>:Telescope buffers<CR>", opts)

-- Neotree
map("", "<TAB>", ":Neotree toggle<CR>", opts)

-- CodeActionMenu
map("n", "cam", "<Cmd>:CodeActionMenu<CR>", opts)

-- Trouble
map("n", "tt", "<Cmd>:TroubleToggle<CR>", opts)

-- Colorizer
map("n", "ct", "<Cmd>:ColorizerToggle<CR>", opts)

-- Lsp
map("n", "<Leader>ho", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<Leader>df", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<Leader>rr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<Leader>sh", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<Leader>gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)

-- Cmp
map("n", "<Leader>gp", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "<Leader>gn", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<Leader>of", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- ToggleTerm
map("n", "<A-S-t>", "<Cmd>ToggleTerm<CR>", opts)
function _G.set_terminal_keymaps()
    local tt_opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], tt_opts)
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], tt_opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], tt_opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], tt_opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], tt_opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], tt_opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], tt_opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Formatter
map("n", "<Leader>F", "<Cmd>Format<CR>", opts)

-- Linter
map("n", "<Leader>L", "<Cmd>Lint<CR>", opts)
map("n", "=G", "<Cmd>Format<CR>", opts)
