require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    checker = {
        enabled = true,
        notify = false,
    },
    rtp = {
        disabled_plugins = {
            "gzip",
            "rplugin",
            "tarplugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        },
    },
})

vim.api.nvim_set_keymap(
    "n",
    "<Leader>of",
    ':lua vim.diagnostic.open_float(0, {scope="line"})<enter>',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<Leader>gn",
    ':lua vim.diagnostic.goto_next() <enter>',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<Leader>gp",
    ':lua vim.diagnostic.goto_prev() <enter>',
    { noremap = true }
)
