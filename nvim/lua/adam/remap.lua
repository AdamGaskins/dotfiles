vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")

-- deletes without yanking
vim.keymap.set({"x", "n"}, "<leader>d", "\"_d")
-- replaces selected text without yanking
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- git log --graph --all --decorate
vim.api.nvim_create_user_command('Glog', function()
    vim.cmd("G log --graph --all --decorate", false)
end, {})
