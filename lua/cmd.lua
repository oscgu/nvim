-- Neotree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

--- Ansible Lint
local function is_ansible_project()
    local current_path = vim.fn.expand("%:p:h")
    while current_path ~= "/" do
        if vim.fn.isdirectory(current_path .. "/inventories") == 1 then
            return true
        end
        current_path = vim.fn.fnamemodify(current_path, ":h")
    end
    return false
end

local function set_ansible_filetype()
    if is_ansible_project() then
        vim.cmd("set filetype=yaml.ansible")
    end
end

_G.set_ansible_filetype = set_ansible_filetype

vim.cmd([[
augroup ansible_project
autocmd!
autocmd BufRead,BufNewFile *.yml lua set_ansible_filetype()
augroup END
]])

local user_cmd = vim.api.nvim_create_user_command

--Peek
user_cmd("PeekOpen", require("peek").open, {})
user_cmd("PeekClose", require("peek").close, {})

local neotest = require("neotest")

--Neotest
user_cmd("NeotestFile", function()
    neotest.run(vim.fn.expand("%"))
end, {})

user_cmd("NeotestSummary", function()
    neotest.summary.toggle()
end, {})

user_cmd("Neotest", function()
    neotest.run(vim.fn.getcwd())
end, {})

--Linter
user_cmd("Lint", function()
    require("lint").try_lint()
end, {})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
