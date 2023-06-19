vim.cmd 'colorscheme oxocarbon'

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <plug.lua> | PackerCompile
augroup end
]])

vim.cmd([[
augroup accurate_syn_hl
autocmd!
autocmd BufEnter * :syntax sync fromstart
augroup END
]])

vim.cmd([[ au BufNewFile,BufRead /*.v setf v ]])

vim.cmd([[ command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%")) ]])
vim.cmd([[ command! NeotestSummary lua require("neotest").summary.toggle() ]])
vim.cmd([[ command! Neotest lua require("neotest").run.run(vim.fn.getcwd()) ]])

vim.cmd([[
augroup project
autocmd!
autocmd BufRead,BufNewFile *.h set filetype=c
augroup END
]])

-- Lightbulb
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]

-- Neotree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
