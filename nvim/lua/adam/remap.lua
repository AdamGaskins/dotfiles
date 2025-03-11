vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")

-- deletes without yanking
vim.keymap.set({"x", "n"}, "<leader>d", "\"_d")
-- replaces selected text without yanking
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
